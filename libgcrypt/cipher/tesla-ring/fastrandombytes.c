/* fastrandombytes.c 
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

#include <stdio.h>

#include "../tesla-ring/crypto_stream.h"
#include "../tesla-ring/gauss/rnd/random.h"
#include "../tesla-ring/randombytes.h"

static int init = 0;
static unsigned char key[crypto_stream_KEYBYTES];
static unsigned char nonce[crypto_stream_NONCEBYTES] = {0};


/*
void set_key(const unsigned char *data, unsigned long long datalen){ 
  //Set key to zero
  unsigned long long i;
  if (datalen > crypto_stream_KEYBYTES){
    printf("Seed too large");
  }

  clear_buffer();

  for(i=0; i<crypto_stream_KEYBYTES; i++){
    key[i]=0;
  }
  for(i=0; i<crypto_stream_NONCEBYTES; i++){
    nonce[i]=0;
  }  

  for(i=0; i<datalen; i++){
    key[i]=data[i];
  }

  init =1;
}

void set_zero_key(){
  int i;
  clear_buffer();

  for(i=0; i<crypto_stream_KEYBYTES; i++){
    key[i]=0;
  }  
  for(i=0; i<crypto_stream_NONCEBYTES; i++){
    nonce[i]=0;
  }  

  init = 1;
}
*/


void get_random_key(){
  int i;
  
  clear_buffer();

  for(i=0; i<crypto_stream_NONCEBYTES; i++){
    nonce[i]=0;
  }  

  randombytes(key, crypto_stream_KEYBYTES);
  init = 1;
}

void fastrandombytes(unsigned char *r, unsigned long long rlen)
{
  unsigned long long n=0;
  int i;
  if(!init){
    randombytes(key, crypto_stream_KEYBYTES);
    init = 1;
  }
  crypto_stream(r,rlen,nonce,key);
  
  // Increase 64-bit counter (nonce)
  for(i=0;i<8;i++)
    n ^= ((unsigned long long)nonce[i]) << 8*i;
  n++;
  for(i=0;i<8;i++)
    nonce[i] = (n >> 8*i) & 0xff;
}
