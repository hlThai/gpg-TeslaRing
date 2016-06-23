/* lattice2.c 
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

#include "../tesla-ring/crypto_hash_sha512.h"
#include "../tesla-ring/crypto_sign.h"
#include "../tesla-ring/ntt.h"
#include "../tesla-ring/params.h"
#include "../tesla-ring/sample.h"
      
//unsigned long long rejwctr;
//unsigned long long rejyzctr;

extern poly poly_a1;
extern poly poly_a2;

static void gcry_compress_v(int32_t t[PARAM_N], double v[PARAM_N])
{
  int i;
  for(i=0;i<PARAM_N;i++){
    double c = v[i] * PARAM_QINV;
    c = floor(c) * PARAM_Q;
    t[i] = ((int64_t)(v[i]-c))>>PARAM_D;
  }
}


static void gcry_compress_sk(unsigned char *sk, poly poly_S, poly poly_E1, poly poly_E2)
{
  int i;
  double *isk = (double *)sk;

    for(i=0; i<PARAM_N; i++)
      isk[i] = poly_S[i];

  isk += PARAM_N;

    for(i=0; i<PARAM_N; i++)
      isk[i] = poly_E1[i];
 isk += PARAM_N;

    for(i=0; i<PARAM_N; i++)
      isk[i] = poly_E2[i];


} 


static void gcry_compress_pk(unsigned char *pk, poly poly_T1, poly poly_T2)
{
  int i;
 double *ipk = (double *)pk;

    for(i=0; i<PARAM_N; i++)
      ipk[i] = poly_T1[i];
    ipk += PARAM_N;
    for(i=0; i<PARAM_N; i++)
      ipk[i] = poly_T2[i];


}


static void gcry_compress_sig(unsigned char *sm, unsigned char *c, double vec_z[PARAM_N])
{
  int i,k;
  int ptr =0;
  int32_t t=0;

  //store the hash value
  for (i=0; i<32; i++){
    sm[ptr++] =c[i];
  }
  for(i=0; i<PARAM_N; i++)
  {
    t = (int32_t)vec_z[i];
    for(k=0;k<3;k++)
      sm[ptr++] = ((t>>(8*(k))) & 0xff);
  }
}


static void gcry_decompress_sig(unsigned char *c, double vec_z[PARAM_N], const unsigned char *sm)
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


static int gcry_test_rejection(poly poly_z)
{
  int i;
  for(i=0; i<PARAM_N; i++){
     if(poly_z[i] < -(PARAM_B-PARAM_U) || poly_z[i] > (PARAM_B-PARAM_U)){
      return 1;
    }
  }
  return 0;
}


static int gcry_test_z(poly vec_z)
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


static int gcry_test_w(poly poly_w)
{
  int i;
  int64_t left, right, val;
  
  for(i=0; i<PARAM_N; i++)
  {
    val = (int64_t) poly_w[i];
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


//check the generated parameter
static int gcry_check_E(poly poly_w)
{
  int i,j,l;
  int bound = PARAM_KEYGEN_BOUND;
  int pos;

  int64_t vals[PARAM_N];
  double max;
  double threshold =0;

    for(j=0; j<PARAM_N; j++){    
      vals[j] = (int64_t)ceil(abs(poly_w[j]));
    } 

    threshold = 0;
    for(i=0; i< PARAM_W; i++){
      max =0;
      pos =0;
      for(l=0; l< PARAM_N; l++){
        if (vals[l] > max){
          max = vals[l];
          pos = l;
        }
      }
      vals[pos] = 0;
      threshold += max;
    }

    if (threshold > bound)
      return -1;
     

  return 0;
}

int gcry_lattice_generateKey(unsigned char *pk, unsigned char *sk)
{
  poly poly_S, poly_E1, poly_T1, poly_T2, poly_E2;


  unsigned long long ctr = 0;
  do
  {
    ctr++;
    sample_gauss_poly(poly_E2);
  }
  while(gcry_check_E(poly_E2) != 0);
  ctr=0;
  do
  {
    ctr++;
    sample_gauss_poly(poly_E1);
  }
  while(gcry_check_E(poly_E1) != 0);
  
  //Sample S
  sample_gauss_poly(poly_S);
  
  //Compute the public key T = AS+E
  poly_mul_fixed(poly_T1,poly_S,poly_a1);
  poly_add(poly_T1,poly_T1,poly_E1);
  poly_mul_fixed(poly_T2,poly_S,poly_a2);
  poly_add(poly_T2,poly_T2,poly_E2);
  
  //Compress everything for usage with supercop API
  gcry_compress_pk(pk, poly_T1, poly_T2);
  gcry_compress_sk(sk, poly_S, poly_E1, poly_E2);


  return 0;
}

//sparse polynomial multiplication
static void gcry_computeEc(poly Ec, const unsigned char *sk, const uint32_t pos_list[PARAM_W])
{
  int i,j;
  int pos;
  double * e;
  e = (double*)sk;
  double temp;
  for(i=0;i<PARAM_N;i++)
    Ec[i] = 0.0;
  for(i=0;i<PARAM_N;i++)
  {
    temp=e[i];
	for(j=0;j<PARAM_W;j++)
	{  
        pos=pos_list[j]+i;
	    if(pos>=PARAM_N){
		    Ec[pos-PARAM_N] += temp;
	    }
	    else{
		    Ec[pos] -= temp;
	    }
	}
  }
}


int gcry_lattice_pk_sign(unsigned char *sm,
                unsigned long long *smlen, 
                const unsigned char *m,
                unsigned long long mlen,
                const unsigned char* sk)
{  
  uint32_t pos_list[PARAM_W];
  poly vec_y;
  poly vec_v1;
  poly vec_v2; 
  poly Sc;
  poly E1c;
  poly E2c;

  /*unsigned long long ctr=0;*/
  unsigned char c[64];
  unsigned long long i;

//  rejwctr=0;
//  rejyzctr=0;

  //Loop due to possible rejections
  while(1)
  {

    //Sample y uniformly random from [-B,B]
    sample_y(vec_y);
  
      
    poly_mul_fixed(vec_v1, vec_y, poly_a1); // v1 <- a_1*y (mod q)
    poly_mul_fixed(vec_v2, vec_y, poly_a2); // v2 <- a_2*y (mod q)
    
    //Hash v together with the message
    int32_t t1[PARAM_N],t2[PARAM_N];
	unsigned char buf[2*PARAM_N+mlen];

	gcry_compress_v(t1, vec_v1);
	gcry_compress_v(t2, vec_v2);
	for(i=0; i<PARAM_N; i++)
	  buf[i] = t1[i];
	for(i=0; i<PARAM_N; i++)
	  buf[i+PARAM_N] = t2[i];
	for(i=0; i<mlen; i++)
	  buf[i+2*PARAM_N] = m[i];

    crypto_hash_sha512(c, buf, mlen+2*PARAM_N); // hash everything together

    generate_c(pos_list, c);
    
    gcry_computeEc(E1c, sk+sizeof(double)*PARAM_N, pos_list);
    poly_sub(vec_v1,vec_v1, E1c);
    //test v1
    if (gcry_test_w(vec_v1) != 0)
    {
        continue;
    }

    gcry_computeEc(E2c, sk+sizeof(double)*PARAM_N*2, pos_list);
    poly_sub(vec_v2,vec_v2, E2c);
    //test v2
    if (gcry_test_w(vec_v2) != 0)
    {
        continue;
    }  

	gcry_computeEc(Sc, sk, pos_list);
	poly_add(vec_y, vec_y, Sc);
    // rejection sampling
	if (gcry_test_rejection(vec_y) != 0)
	{
	    continue;
	}
      

    //Copy the message into the signature package
    for(i=0; i<mlen; i++)
      sm[i]=m[i];
    
    //Length of the output
    *smlen = CRYPTO_BYTES + mlen;  
    //Put the signature into the output package
	gcry_compress_sig(sm+mlen, c, vec_y);
  }
  return 0;
}


int gcry_lattice_pk_verify(unsigned char *m,
                     unsigned long long *mlen,
                     const unsigned char *sm,
                     unsigned long long smlen,
                     const unsigned char *pk)
{
  unsigned char c[32];
  unsigned char c_sig[64];
  uint32_t pos_list[PARAM_W];
  
	/*int i;*/
  poly vec_w1;
  poly vec_w2;
  poly vec_z;
  poly T1c,T2c;

  if (smlen < CRYPTO_BYTES) return -1;

  gcry_decompress_sig(c, vec_z, sm+smlen-CRYPTO_BYTES);
  //Check norm of z
  if (gcry_test_z(vec_z) != 0) return -1;
  //From hash (bytes) to polynomial c: F(c)
  generate_c(pos_list, c);
  //wi = Aiz-Tci
  poly_mul_fixed(vec_w1, vec_z, poly_a1);
  poly_mul_fixed(vec_w2, vec_z, poly_a2); 
  gcry_computeEc(T1c, pk, pos_list);
  gcry_computeEc(T2c, pk+sizeof(double)*PARAM_N,pos_list);
  poly_sub(vec_w1,vec_w1, T1c);
  poly_sub(vec_w2,vec_w2,T2c);
  
  //obtain the hash c
  int32_t t1[PARAM_N],t2[PARAM_N];
  int i;
  int len =((int)smlen - (int)CRYPTO_BYTES);
  unsigned char buf[2*PARAM_N+len];

  gcry_compress_v(t1, vec_w1);
  gcry_compress_v(t2, vec_w2);
	for(i=0; i<PARAM_N; i++)
	  buf[i] = t1[i];
	for(i=0; i<PARAM_N; i++)
	  buf[i+PARAM_N] = t2[i];
	for(i=0; i<len; i++)
	  buf[i+2*PARAM_N] = sm[i];

  crypto_hash_sha512(c_sig, buf, len+2*PARAM_N); // hash everything together

  if(memcmp(c,c_sig,32)) return -1;
  
  *mlen = smlen-CRYPTO_BYTES;
  memcpy(m,sm,*mlen);

  return 0;
}
