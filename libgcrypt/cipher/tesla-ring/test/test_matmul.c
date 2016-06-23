#include "../arith.h"
#include <stdio.h>
#include "../../tesla-ring/crypto_sign.h"
#include "../../tesla-ring/fastrandombytes.h"
#include "../../tesla-ring/params.h"

extern double matrix_At[PARAM_N][PARAM_M];

unsigned char sk[CRYPTO_SECRETKEYBYTES];
unsigned char pk[CRYPTO_PUBLICKEYBYTES];



int main(void)
{
  uint32_t pos[19];
  double sign[19];
  double vec_v1[PARAM_M];
  double vec_v2[PARAM_M];
  int i;
  
  crypto_sign_keypair(pk,sk);

  FILE *urandom = fopen("/dev/urandom", "r");

  for(i=0;i<19;i++)
  {
    pos[i] = fgetc(urandom);
    sign[i] = 1;
  }

  qmul_nk_gauss_n_sparse_add(vec_v1, sk, pos, sign);
  for(i=0;i<PARAM_N;i++)
    printf("%lf, ", vec_v1[i]);
  printf("\n\n");

  newmul_nk_gauss_n_sparse_add(vec_v2, sk, pos, sign);
  for(i=0;i<PARAM_N;i++)
    printf("%lf, ", vec_v2[i]);
  printf("\n\n");

  fclose(urandom);

  return 0;
}
