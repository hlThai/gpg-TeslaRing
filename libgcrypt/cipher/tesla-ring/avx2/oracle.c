#include <stdint.h>

#include "../../tesla-ring/avx2/crypto_hash_sha256.h"
#include "../../tesla-ring/avx2/params.h"

static void compress_v(int32_t t[PARAM_M], double v[PARAM_M])
{
  int i;
  for(i=0;i<PARAM_M;i++)
    t[i] = (int32_t)((int64_t)v[i] >> PARAM_D);
}

void random_oracle(unsigned char *c_bin,  double v[PARAM_M], const unsigned char *m, unsigned long long mlen)
{
  int32_t t[PARAM_M];
  unsigned long long i;
  unsigned char buf[PARAM_M+mlen];

  compress_v(t, v);
  
  for(i=0; i<PARAM_M; i++)
    buf[i] = t[i];
  for(i=0; i<mlen; i++)
    buf[i+PARAM_M] = m[i];

  crypto_hash_sha256(c_bin, buf, PARAM_M+mlen);
}


