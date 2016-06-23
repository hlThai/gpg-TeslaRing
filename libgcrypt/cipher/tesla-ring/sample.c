/* sample.c 
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

#include "../tesla-ring/sample.h"

#include "../tesla-ring/crypto_stream.h"
#include "../tesla-ring/fastrandombytes.h"

//Interface of Gauss sampler
extern int32_t sample_gauss(void);
static double fmodq(double x)
{
  double c = x * PARAM_QINV;
  c = round(c);
  c *= PARAM_Q;
  return x-c;
}

void sample_y(double mat_y[PARAM_N])
{
  int32_t val;
  unsigned char buf[3*PARAM_N+68];
  int pos=0, i=0;
  
  fastrandombytes(buf,3*PARAM_N+68);
  do
  {
    if(pos == 3*PARAM_N+66)
    {
      fastrandombytes(buf,3*PARAM_N+68);
      pos = 0;
    }
    val  = (*(int32_t *)(buf+pos)) & 0x7fffff;

    if(val < 0x7fffff)
      mat_y[i++] = val-PARAM_B;

    pos+=3;
  }
  while(i< PARAM_N);
}




void sample_gauss_poly(poly x)
{
  unsigned int j;
  double gauss;

    for(j=0; j<PARAM_N; j++)
    {
      gauss = fmodq(sample_gauss());
      x[j] = gauss;
    }
}

void generate_c(uint32_t *pos_list, unsigned char *c_bin)
{
  int i;
  double c[PARAM_N];

  //Now generate the F(c) value
  unsigned char nonce[crypto_stream_NONCEBYTES] = {1,2,3,4,5,6,7,8};
  const int R_LENGTH = 800;
  unsigned char r[R_LENGTH];

  //Use the hash value as key to generate some randomness
  crypto_stream(r, R_LENGTH, nonce, c_bin);

  //Now populate the vector
  int cnt =0;
  int pos;

  //Use rejection sampling to determine positions to be set in the new vector
  for(i=0; i<PARAM_N; i++)
    c[i] = 0;

  i=0;
  while(i<PARAM_W)
  {
    //sample a position (0 to n-1). Use two bytes
    pos = 0;
    pos = (r[cnt]<<8) | (r[cnt+1]);
    pos = pos & ((1<<PARAM_N_LOG)-1);
    cnt += 2;

    if (pos<PARAM_N)
    {
      //position is between [0,n-1]
      if (c[pos] == 0)
      {
        pos_list[i] = pos;
	c[pos]=1;
	i++;
        cnt++;
      }
    }
  }
}
