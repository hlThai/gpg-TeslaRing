#include <stdint.h>
#include <stdio.h>

#include "../../tesla-ring/avx2/crypto_stream_chacha8.h"
#include "../../tesla-ring/avx2/gauss/rnd/random.h"
#include "../../tesla-ring/avx2/params.h"

static char key[32] = "Generate matrix A for TESLA-256!";
static unsigned char nonce[8] = {0};
static const int32_t matrix_At[PARAM_N][PARAM_M];

/* Increase little-endian nonce */
static void inc_nonce()
{
  unsigned long long t=0;
  int i;
  for(i=0;i<8;i++)
    t |= (unsigned long long)nonce[i] << 8*i;
  t++;
  for(i=0;i<8;i++)
    nonce[i] = (t >> 8*i) & 0xff;
}

int32_t tocoeff(const unsigned char *x)
{
#if PARAM_Q_LOG == 28
  int i;
  int32_t r=0;
  for(i=0;i<4;i++)
    r |= (int32_t)x[i] << 8*i;

  r <<= 4;
  r >>= 4;

  if(r>PARAM_Q/2 || r < -PARAM_Q/2)
    printf("ERROR: matrix coefficient too large!\n");

  return r;
#else
#error "Function tocoeff needs 28-bit Q"
#endif
}

//This matrix is generated only once and then stays in memory
int main(void)
{
  unsigned int rowbytes = 4*PARAM_M,i,j;
  unsigned char row[rowbytes];
  
  printf("#include <stdint.h>\n");
  printf("#include \"params.h\"\n\n");

  printf("int32_t matrix_At[PARAM_N][PARAM_M] = {\n");

  /* Iterate over all rows of A */
  for(i=0;i<PARAM_N;i++)
  {
    crypto_stream_chacha8(row,rowbytes,nonce,(unsigned char *)key);
    printf("{");
    for(j=0;j<PARAM_M-1;j++)
    {
      printf("%d,",tocoeff(row+4*j));
      if(!((j+1)%16))
        printf("\n");
    }
    printf("%d},\n",tocoeff(row+4*j));
    inc_nonce();
  }
  printf("};");

  return 0;
}
