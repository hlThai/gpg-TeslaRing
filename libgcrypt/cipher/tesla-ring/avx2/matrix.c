#include "../../tesla-ring/avx2/matrix.h"

#include <stdint.h>
#include <math.h>
#include "assert.h"
#include "../../tesla-ring/avx2/params.h"

static double fmodq(double x)
{
  double c = x * PARAM_QINV;
  c = round(c);
  c *= PARAM_Q;
  return x-c;
}


void vector_add_n(double *r, const double *x, const double *y)
{
  unsigned int i;
  for(i=0;i<PARAM_N;i++)
    r[i] = fmodq(x[i] + y[i]);
}

void matrix_mul_mnk(double *r, const double *x, const double *y)
{
  unsigned int i,j,k;
  for(i=0;i<PARAM_M;i++)
  {
    for(j=0;j<PARAM_K;j++)
    {
      r[i*PARAM_K+j] = 0;
      for(k=0;k<PARAM_N;k++)
      {
        r[i*PARAM_K+j] += fmodq(x[i*PARAM_N+k] * y[k*PARAM_K+j]);
        r[i*PARAM_K+j]  = fmodq(r[i*PARAM_K+j]);
      }
    }
  }
}

void matrix_add_mk(double *r, const double *x, const double *y)
{
  unsigned int i;
  for(i=0;i<PARAM_M*PARAM_K;i++)
    r[i] = fmodq(x[i] + y[i]);
}
