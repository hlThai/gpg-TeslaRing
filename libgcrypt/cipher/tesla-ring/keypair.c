/* keypair.c 
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

#include <math.h>
#include <string.h>
#include <stdlib.h>

#include "gauss/rnd/random.h"
#include "crypto_stream_chacha20.h"
#include "params.h"
#include "matrix.h"
#include "randombytes.h"
#include "api.h"

extern int32_t matrix_At[PARAM_N][PARAM_M];

//Interface of Gauss sampler
extern int32_t sample_gauss(void);

void sample_gauss_mat(double *mat, unsigned int rows, unsigned int columns)
{
  unsigned int i,j;
  double gauss;

  //Sample a matrix with Gaussian values
  for(i=0; i<rows; i++)
  {
    for(j=0; j<columns; j++)
    {
      gauss = (sample_gauss()) % PARAM_Q;
      mat[i*columns+j] = gauss;
    }
  }
}

static void compress_sk(unsigned char *sk, double *mat_S, double *mat_E )
{
  int i,j;
  int16_t *isk = (int16_t *)sk;

  for(j=0; j<PARAM_K; j++)
    for(i=0; i<PARAM_N; i++)
      isk[PARAM_N*j+i] = (int16_t)mat_S[PARAM_K*i+j];

  isk += PARAM_N*PARAM_K;

  for(j=0; j<PARAM_K; j++)
    for(i=0; i<PARAM_M; i++)
      isk[PARAM_M*j+i] = (int16_t)mat_E[PARAM_K*i+j];

} 

static void decompress_sk(unsigned char *sk, double *mat_S, double *mat_E) {
	  int i,j;
	  int16_t *isk = (int16_t *)sk;

	  for(j=0; j<PARAM_K; j++)
	    for(i=0; i<PARAM_N; i++)
	      mat_S[PARAM_K*i+j] = (double) isk[PARAM_N*j+i];

	  isk += PARAM_N*PARAM_K;

	  for(j=0; j<PARAM_K; j++)
	    for(i=0; i<PARAM_M; i++)
	      mat_E[PARAM_K*i+j] = (double) isk[PARAM_M*j+i];
}

static void compress_pk(unsigned char *pk, double *mat_T)
{
  int i,j;
  int32_t *ipk = (int32_t *)pk;

  for(j=0; j<PARAM_K; j++)
    for(i=0; i<PARAM_M; i++)
      ipk[PARAM_M*j+i] = (int32_t)mat_T[PARAM_K*i+j];
}

static int check_E(double *mat_w)
{
  int i,j,k,l;
  int bound = PARAM_KEYGEN_BOUND;
  int pos;

  double vals[PARAM_M];
  double max;
  double threshold =0;
  double max_threshold = 0;

  //Very inefficiently programmed, just for testing
  //Do the addition
  //Do not mix rows and columns

  for(k=0; k<PARAM_M; k++)
  {
    //Copy a whole row into vals
    for(j=0; j<PARAM_K; j++){    
      vals[j] = ceil(abs(mat_w[k*PARAM_K+j]));
    } 

    //Now find the \omega (w) largest values in val
    threshold = 0;
    for(i=0; i< PARAM_W; i++){
      max =0;
      pos =0;
      for(l=0; l< PARAM_K; l++){
        if (vals[l] > max){
          max = vals[l];
          pos = l;
        }
      }
      vals[pos] = 0.0;
      threshold += max;
    }

    if (threshold> max_threshold){
      max_threshold = threshold;
    }
    if (threshold > bound)
      return -1;
  }   

  return 0;
}

int check_lattice_secret_key(unsigned char *pk, unsigned char *sk) {
  double *mat_S, *mat_E, *mat_T, *mat_A;
  mat_S = malloc(PARAM_N*PARAM_K*sizeof(double));
  mat_E = malloc(PARAM_M*PARAM_K*sizeof(double));
  mat_T = malloc(PARAM_M*PARAM_K*sizeof(double));
  mat_A = malloc(PARAM_M*PARAM_N*sizeof(double));

  int i,j, res;
  unsigned char *pk_check;
  pk_check= malloc(CRYPTO_PUBLICKEYBYTES);

  //Obtain mat_A /*XXX: Can avoid that by modifying matrix_mul_mnk to work with transposed third argument */
  for(i=0;i<PARAM_M;i++)
    for(j=0;j<PARAM_N;j++)
      mat_A[i*PARAM_N+j] = matrix_At[j][i];

  decompress_sk(sk+crypto_stream_chacha20_KEYBYTES, mat_S, mat_E);
  matrix_mul_mnk(mat_T, mat_A, mat_S);
  matrix_add_mk(mat_T, mat_T, mat_E);

  compress_pk(pk_check, mat_T);

  res = memcmp(pk_check, pk,(CRYPTO_PUBLICKEYBYTES));
  return res;
}

int crypto_sign_keypair(unsigned char *pk, unsigned char *sk)
{
  double *mat_S, *mat_E, *mat_T, *mat_A;
  unsigned int i,j;

  mat_S = malloc(PARAM_N*PARAM_K*sizeof(double));
  mat_E = malloc(PARAM_M*PARAM_K*sizeof(double));
  mat_T = malloc(PARAM_M*PARAM_K*sizeof(double));
  mat_A = malloc(PARAM_M*PARAM_N*sizeof(double));
  if(!(mat_S && mat_E && mat_T && mat_A))
    return -2;

  //Sample Gaussian distributed matrix E first
  /*unsigned long long */
  do
  {
    sample_gauss_mat(mat_E, PARAM_M, PARAM_K);
  }
  while(check_E(mat_E) != 0);

  //Now sample S
  sample_gauss_mat(mat_S, PARAM_N, PARAM_K);

  //Obtain mat_A /*XXX: Can avoid that by modifying matrix_mul_mnk to work with transposed third argument */
  for(i=0;i<PARAM_M;i++)
    for(j=0;j<PARAM_N;j++)
      mat_A[i*PARAM_N+j] = matrix_At[j][i];

  //Compute the public key T = AS+E
  //Here we have a "real" matrix-matrix computation and might want to use Strassen
  matrix_mul_mnk(mat_T, mat_A, mat_S);
  matrix_add_mk(mat_T, mat_T, mat_E);

  //Compress everything for usage with supercop API
  compress_pk(pk, mat_T);
  compress_sk(sk+crypto_stream_chacha20_KEYBYTES, mat_S, mat_E);

  randombytes(sk,crypto_stream_chacha20_KEYBYTES);

  //Free all allocated matrices
  free(mat_S);
  free(mat_E);
  free(mat_T);
  free(mat_A);

  return 0;
}

