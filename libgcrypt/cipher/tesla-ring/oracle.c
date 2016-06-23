/* oracle.c 
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

#include <stdint.h>

#include "../tesla-ring/crypto_hash_sha256.h"
#include "../tesla-ring/params.h"

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


