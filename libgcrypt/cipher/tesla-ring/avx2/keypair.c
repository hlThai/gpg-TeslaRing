#include <math.h>
#include <string.h>
#include <stdlib.h>

#include "../../tesla-ring/avx2/crypto_stream_chacha20.h"
#include "../../tesla-ring/avx2/gauss/rnd/random.h"
#include "../../tesla-ring/avx2/matrix.h"
#include "../../tesla-ring/avx2/params.h"
#include "../../tesla-ring/avx2/randombytes.h"

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

