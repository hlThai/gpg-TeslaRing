/* ntt.c 
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

#include "../tesla-ring/ntt.h"

void ntt_transform(poly,const poly);

static void mul_coefficients(poly  x, poly  c);

static double fmodq(double x)
{
  double c = x * PARAM_QINV;
  c = round(c);
  c *= PARAM_Q;
  return x-c;
}

static void mul_coefficients(poly  x, poly  c)
{
    unsigned int i;

    for(i = 0; i < PARAM_N; i++) {
        x[i] = fmodq(x[i] * c[i]);
    }
}

void poly_mul_fixed(poly  result, const poly  x, const poly  a)
{
    unsigned int i;

    if (result != x)
        for(i = 0; i < PARAM_N; i++)
            SETCOEFF(result[i], x[i]);


    mul_coefficients(result, psis);

    ntt_transform(result, omegas);


    for(i = 0; i < PARAM_N; i++)
    {
        result[i]= fmodq(result[i]* a[i]);
    }

    ntt_transform(result, omegas_inv);
    
    mul_coefficients(result, psis_inv);

}


void poly_add(poly  result, const poly  x, const poly  y)
{
    unsigned int i;

    for(i = 0; i < PARAM_N; i++)
    {
        result[i] = fmodq(x[i] + y[i]);
    }
}
void poly_sub(poly  result, const poly  x, const poly  y)
{
    unsigned int i;

    for(i = 0; i < PARAM_N; i++)
    {
        result[i] = fmodq(x[i] - y[i]);
    }
}
