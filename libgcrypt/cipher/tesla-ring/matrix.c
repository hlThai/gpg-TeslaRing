/* matrix.c 
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

#include "../tesla-ring/matrix.h"

#include <stdint.h>
#include <math.h>
#include "assert.h"
#include "../tesla-ring/params.h"

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
