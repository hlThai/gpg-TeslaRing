#include <stdio.h>
#include <stdlib.h>

#include "../../tesla-ring/cpucycles.h"
#include "../../tesla-ring/crypto_sign.h"
#include "../../tesla-ring/fastrandombytes.h"
#include "../../tesla-ring/matrix.h"
#include "../../tesla-ring/randombytes.h"
#include "../../tesla-ring/sign.h"


#define MLEN 59
#define NRUNS 50
#define NRUNS_GEN 2
#define NRUNS_SIGN 100000
#define NRUNS_VERIF 100

//int get_sig_rejections(void);

static int cmp_llu(const void *a, const void*b)
{
  if(*(unsigned long long *)a < *(unsigned long long *)b) return -1;
  if(*(unsigned long long *)a > *(unsigned long long *)b) return 1;
  return 0;
}


static unsigned long long median(unsigned long long *l, size_t llen)
{
  qsort(l,llen,sizeof(unsigned long long),cmp_llu);

  if(llen%2) return l[llen/2];
  else return (l[llen/2-1]+l[llen/2])/2;
}

static unsigned long long average(unsigned long long *t, size_t tlen)
{
  unsigned long long acc=0;
  size_t i;
  for(i=0;i<tlen;i++)
    acc += t[i];
  return acc/(tlen);
}

static void print_results(const char *s, unsigned long long *t, size_t tlen)
{
  size_t i;
  printf("%s", s);
  for(i=0;i<tlen-1;i++)
  {
    t[i] = t[i+1] - t[i];
    printf("%llu ", t[i]);
  }
  printf("\n");
  printf("median: %llu\n", median(t, tlen));
  printf("average: %llu\n", average(t, tlen-1));
  printf("\n");
}


unsigned char mi[MLEN];
unsigned char mo[MLEN+crypto_sign_BYTES];
unsigned char sm[MLEN+crypto_sign_BYTES];
unsigned char pk[crypto_sign_PUBLICKEYBYTES];
unsigned char sk[crypto_sign_SECRETKEYBYTES];
unsigned long long smlen, mlen;

#ifndef PARALLEL
#define PARALLEL 6
#endif



extern const int32_t matrix_At[PARAM_N][PARAM_M];

unsigned long long t[NRUNS_SIGN];

int main()
{
  int i,j;
  double vec_n[PARALLEL*PARAM_N];
  double vec_m[PARALLEL*PARAM_M];

  FILE *urandom = fopen("/dev/urandom", "r");

  for(i=0;i<PARALLEL*PARAM_N;i++)
    vec_n[i] = 42.;
  for(i=0;i<PARALLEL*PARAM_M;i++)
    vec_m[i] = 42.;

  for(i=0;i<NRUNS_GEN;i++)
  {
    t[i] = cpucycles();
    crypto_sign_keypair(pk, sk);
  }
  print_results("crypto_sign_keypair: ", t, NRUNS_GEN);

  randombytes(mi,MLEN);
  
  for(i=0;i<NRUNS_SIGN;i++)
  {
    t[i] = cpucycles();
    
    crypto_sign(sm, &smlen, mi, MLEN, sk);
    for(j=0;j<4;j++)
      mi[j] = i >> (8*j) & 0xff; //Change message for proper benchmarking
  }
  print_results("crypto_sign: ", t, NRUNS_SIGN);

  for(i=0;i<NRUNS_VERIF;i++)
  {
    t[i] = cpucycles();
    crypto_sign_open(mo, &mlen, sm, smlen, pk);
  }
  print_results("crypto_sign_open: ", t, NRUNS_VERIF);

  for(i=0;i<NRUNS;i++)
  {
    t[i] = cpucycles();
    mul_mn_uniQ_n_uniB(vec_m, vec_n, matrix_At);
  }
  print_results("mul Ay: ", t, NRUNS);


  fclose(urandom);
  return 0;
}



