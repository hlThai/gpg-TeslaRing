#include <stdlib.h>
#include <stdint.h>

#include "../../../tesla-ring/crypto_stream_chacha20.h"
#include "../../../tesla-ring/randombytes.h"

#define BUF_VARS 4096
static int32_t buf_cnt = -1;
static uint8_t buf[BUF_VARS];

static unsigned char nonce[crypto_stream_chacha20_NONCEBYTES] = {0};

uint8_t get_random_8(void)
{
  unsigned char key[crypto_stream_chacha20_KEYBYTES];
  
  if (buf_cnt < 0){
    randombytes(key,crypto_stream_chacha20_KEYBYTES);
    crypto_stream_chacha20(buf, BUF_VARS, nonce, key);   
    buf_cnt = BUF_VARS-1;
  }
  
 return buf[buf_cnt--];
}
