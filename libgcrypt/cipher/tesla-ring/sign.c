/* sign.c 
 *
 * Copyright (C) 2015 2016 Sedat Akleylek, Nina Bindel, Johannes Buchmann, Juliane Krämer, Giorgia Azzurra Marson
 *
 * This file is part of Libgcrypt.
 *
 * Libgcrypt is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * Libgcrypt is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program; if not, see <http://www.gnu.org/licenses/>.
 */


#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#include "../tesla-ring/api.h"
#include "../tesla-ring/crypto_hash_sha256.h"
#include "../tesla-ring/crypto_sign.h"
#include "../tesla-ring/crypto_stream_chacha20.h"
#include "../tesla-ring/matrix.h"
#include "../tesla-ring/oracle.h"
#include "../tesla-ring/params.h"

extern const int32_t matrix_At[PARAM_N][PARAM_M];
extern void mul_mn_uniQ_n_uniB3x(double *r, const double *x, const int32_t A[PARAM_N][PARAM_M]);

static double fmodq(double x)
{
  double c = x * PARAM_QINV;
  c = round(c);
  c *= PARAM_Q;
  return x-c;
}


static void compress_sig(unsigned char *sm, unsigned char *c, double vec_z[PARAM_N])
{
  int i,k;
  int ptr =0;
  int32_t t;

  //store the hash value
  for (i=0; i<32; i++){
    sm[ptr++] =c[i];
  }

  //compress the signature vector z
  for(i=0; i<PARAM_N; i++)
  {
    t = vec_z[i];
    for(k=0;k<3;k++)
      sm[ptr++] = (t>>(8*k)) & 0xff;
  }
}


static void decompress_sig(unsigned char *c, double vec_z[PARAM_N], const unsigned char *sm)
{
  int i,k;
  int ptr =0;
  int32_t t;

  //store the hash value
  for (i=0; i<32; i++){
    c[i] =sm[ptr++];
  }

  //compress the signature vector z  
  for(i=0; i<PARAM_N; i++)
  {
    t = 0;
    for(k=0;k<3;k++)
      t |= ((int32_t)sm[ptr++]) << (8*(k+1));
    vec_z[i] = (double)(t>>8);
  }  
}  


static int test_rejection(double mat_z[PARAM_N])
{
  int i;

  for(i=0; i<PARAM_N; i++)
    if(mat_z[i] < -(PARAM_B-PARAM_U) || mat_z[i] > (PARAM_B-PARAM_U))
      return 1;
  return 0;
}


static int test_z(double vec_z[PARAM_N])
{
  int i;
  int64_t val;
  
  for(i=0; i<PARAM_N; i++)
  {
    val = ((int64_t)(vec_z[i])) % PARAM_Q;

    if (val > PARAM_Q/2){
      val = val - PARAM_Q;
    }

    if (val < -PARAM_Q/2){
      val = val + PARAM_Q;
    }

    if (abs(val) > (PARAM_B-PARAM_U)){
      return -1;
    }
  }
  return 0;
}


static int test_w(double mat_w[PARAM_M])
{
  int i;
  int64_t left, right, val;
  
  for(i=0; i<PARAM_M; i++)
  {
    val = (int64_t) mat_w[i];
    val = val % PARAM_Q;

    if (val < 0){
      val = val + PARAM_Q;
    }

    left = val;
    left = left % (1<<(PARAM_D)); 

    left -= (1<<PARAM_D)/2; 
    left++;

    right = (1<<(PARAM_D-1))-PARAM_REJECTION;

    if (abs(left) > right)
    {
      return -1;
    }
  }
  return 0;
}


void add_yz(double vec_yz[PARAM_N], int16_t Sc[PARAM_N])
{
  int i;
  for(i=0;i<PARAM_N;i++)
	vec_yz[i] += (double)Sc[i];
}


static void computeSc(int16_t Ec[PARAM_N], const unsigned char *sk, const uint32_t pos_list[PARAM_W], const int16_t sign_list[PARAM_W])
{
  int i,j;
  int16_t * e;
  e = (int16_t*)sk;

  for(i=0;i<PARAM_N;i++)
    Ec[i] = 0;

  for(i=0;i<PARAM_W;i++)
  {
    for(j=0;j<PARAM_N;j++)
    {
        Ec[j] += sign_list[i] * (e+pos_list[i]*PARAM_K)[j];
    }
  }
}


static void computeEc(int16_t Ec[PARAM_M], const unsigned char *sk, const uint32_t pos_list[PARAM_W], const int16_t sign_list[PARAM_W])
{
  int i,j;
  int16_t * e;
  e = (int16_t*)sk;

  for(i=0;i<PARAM_M;i++)
    Ec[i] = 0;

  for(i=0;i<PARAM_W;i++)
  {
    for(j=0;j<PARAM_M;j++)
    {
        Ec[j] += sign_list[i] * (e+pos_list[i]*PARAM_K)[j];
    }
  }
}


static void subred_v(double vec_v[PARAM_N], int16_t Ec[PARAM_N])
{
  int i;
  for(i=0;i<PARAM_N;i++)
  {
    vec_v[i] -= (double)Ec[i];
    fmodq(vec_v[i]);
  }
}


static unsigned long long sample_y(double mat_y[PARAM_N], unsigned long long n, unsigned char *key)
{
  int32_t val;
  unsigned int spare = 64;
  
  unsigned char buf[3*PARAM_N+spare];
  unsigned char nonce[crypto_stream_chacha20_NONCEBYTES];
  unsigned int pos, j, i=0;

  while(i< PARAM_N)
  {
    for(j=0;j<8;j++)
      nonce[j] = n>>(8*j) & 0xff;
    for(;j<crypto_stream_chacha20_NONCEBYTES;i++)
      nonce[j] = 0; //XXX: This can go away for NONCEBYTES == 8
    n++;
    i = pos = 0;
    crypto_stream_chacha20(buf,3*PARAM_N+spare,nonce,key);


    while(i< PARAM_N && pos < 3*PARAM_N+spare-3)
    {
      val  = (*(int32_t *)(buf+pos)) & ((1<<PARAM_B_BITS)-1);

      if(val < PARAM_B)
        mat_y[i++] = val-PARAM_B;

      pos+=3;
    }
  }
  return n;
}


static void generate_c(uint32_t *pos_list, int16_t *sign_list, unsigned char *c_bin)
{
  int i;
  double c[PARAM_N];
  int cnt =0;
  int pos;

  //Now generate the F(c) value
  unsigned char nonce[crypto_stream_chacha20_NONCEBYTES] = {1,2,3,4,5,6,7,8};
  const int R_LENGTH = 800;
  unsigned char r[R_LENGTH];

  //Use the hash value as key to generate some randomness
  crypto_stream_chacha20(r, R_LENGTH, nonce, c_bin);

  //Now populate the vector
  //Use rejection sampling to determine positions to be set in the new vector
  for(i=0; i<PARAM_N; i++)
    c[i] = 0;

  i=0;
  while(i<PARAM_W)
  {
    //sample a position (0 to n-1). Use two bytes
    pos = 0;
    pos = (r[cnt]<<8) | (r[cnt+1]);
    pos = pos & ((1<<PARAM_N_LOG)-1);
    cnt += 2;

    if (pos<PARAM_N)
    {
      //position is between [0,n-1]
      if (c[pos] == 0)
      {
        //position has not been set yet. Determine sign
        if ((r[cnt] & 1) ==1)
          c[pos] = -1;
        else
          c[pos] = 1;
        pos_list[i] = pos;
        sign_list[i] = c[pos];
        i++;
        cnt++;
      }
    }
  }
}

#ifndef PARALLEL
#define PARALLEL 3
#endif

int crypto_sign(unsigned char *sm, 
                unsigned long long *smlen, 
                const unsigned char *m,
                unsigned long long mlen,
                const unsigned char* sk)
{  
  uint32_t pos_list[PARAM_W];
  int16_t sign_list[PARAM_W];
  double vec_yz3x[PARALLEL*PARAM_N];
  double vec_v3x[PARALLEL*PARAM_M];
  int16_t Sc[PARAM_N];
  int16_t Ec[PARAM_M];
  unsigned char ykey[crypto_stream_chacha20_KEYBYTES];
  unsigned long long ynonce = 0;

  unsigned char c[crypto_hash_sha256_BYTES];
  unsigned long long i,j;

  
  //Copy the message into the signature package
  for(i=0; i<mlen; i++)
    sm[i+CRYPTO_BYTES]=m[i];

  for(i=0;i<32;i++)
    sm[i+CRYPTO_BYTES-32] = sk[i];

  // Derive stream cipher key for deterministic sampling of y
  crypto_hash_sha256(ykey,sm+CRYPTO_BYTES-32,mlen+32);

  // Wipe secret-key bytes from sm
  for(i=0;i<32;i++)
    sm[i+CRYPTO_BYTES-32] = 0;

  //Loop due to possible rejections
  while(1)
  {
    //Sample y uniformly random from [-B,B]
    for(j=0;j<PARALLEL;j++)
      ynonce = sample_y(vec_yz3x+j*PARAM_N,ynonce,ykey);

    //Compute v = Ay. Note that A is uniformly random from Z_q but y is from [-B,B]
    
    mul_mn_uniQ_n_uniB3x(vec_v3x, vec_yz3x, matrix_At);

    for(j=0;j<PARALLEL;j++)
    {
      //mul_mn_uniQ_n_uniB(vec_v3x+j*PARAM_M, vec_yz3x+j*PARAM_N, matrix_At);

      //Hash v together with the message
      random_oracle(c, vec_v3x+j*PARAM_M, m, mlen);
      generate_c(pos_list, sign_list, c);

      //v = w = Az-Tc = Ay-Ec = v - Ec
      //v = v - Ec
      computeEc(Ec, sk+crypto_stream_chacha20_KEYBYTES+sizeof(int16_t)*PARAM_N*PARAM_K, pos_list, sign_list);
      subred_v(vec_v3x+j*PARAM_M, Ec);
      
      
      //test v
      if (test_w(vec_v3x+j*PARAM_M) != 0) continue;
      

      //No modulo necessary - S and c are small
      //Add Sc to yz (y becomes now z)
      computeSc(Sc, sk+crypto_stream_chacha20_KEYBYTES, pos_list, sign_list);
      add_yz(vec_yz3x+j*PARAM_N, Sc);
      
      // rejection sampling
      if (test_rejection(vec_yz3x+j*PARAM_N) != 0) continue;
      
      //Put the signature into the output package
      compress_sig(sm, c, vec_yz3x+j*PARAM_N);

      //Length of the output
      *smlen = CRYPTO_BYTES + mlen;  

      return 0;

    }
  }
}





int crypto_sign_open(unsigned char *m,
                     unsigned long long *mlen,
                     const unsigned char *sm,
                     unsigned long long smlen,
                     const unsigned char *pk)
{
  unsigned char c[crypto_hash_sha256_BYTES];
  unsigned char c_sig[crypto_hash_sha256_BYTES];
  uint32_t pos_list[PARAM_W];
  int16_t sign_list[PARAM_W];
  double dsign_list[PARAM_W];
  unsigned long long i;

  double vec_w[PARAM_M];
  double vec_z[PARAM_N];

  if (smlen < CRYPTO_BYTES) return -1;

  decompress_sig(c, vec_z, sm);
  
  //Check norm of z
  if (test_z(vec_z) != 0) return -1;
  
  //From hash (bytes) to polynomial c: F(c)
  generate_c(pos_list, sign_list, c);

  for(i=0;i<PARAM_W;i++)
    dsign_list[i] = (double)sign_list[i];
  
  mul_mn_uniQ_n_uniB(vec_w, vec_z, matrix_At);
  
  //w = Az-Tc
  mul_mk_gauss_m_sparse_subred(vec_w, pk, pos_list, dsign_list);
  
  //obtain the hash c
  random_oracle(c_sig, vec_w, sm+CRYPTO_BYTES, smlen - CRYPTO_BYTES);

  if(memcmp(c,c_sig,crypto_hash_sha256_BYTES)) return -1;
  
  *mlen = smlen-CRYPTO_BYTES;

  for(i=0; i<*mlen; i++)
    m[i]=sm[i+CRYPTO_BYTES];

  return 0;
}
