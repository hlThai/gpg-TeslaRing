#include <stdio.h>
#include <string.h>

#include "../../tesla-ring/api.h"
#include "../../tesla-ring/crypto_sign.h"

#define MLEN 100

unsigned char sk[CRYPTO_SECRETKEYBYTES];
unsigned char pk[CRYPTO_PUBLICKEYBYTES];


unsigned char mi[MLEN];
unsigned char mo[MLEN+CRYPTO_BYTES];
unsigned char sm[MLEN+CRYPTO_BYTES];
unsigned long long smlen;
unsigned long long mlen;

extern double matrix_At[PARAM_N][PARAM_M];

void create_file(char* filename)
{
  unsigned int j;
  FILE *urandom = fopen("/dev/urandom", "r");

  crypto_sign_keypair(pk, sk);
  for(j=0;j<MLEN;j++) 
      mi[j] = fgetc(urandom);
  crypto_sign(sm, &smlen, mi, MLEN, sk);    

  FILE *file;
  file=fopen(filename,"wb");

  if(file == NULL)
	printf("Unable to open file!\n");

  fwrite(pk, 1, CRYPTO_PUBLICKEYBYTES, file);
  fwrite(sm, 1, MLEN+CRYPTO_BYTES, file);
  fwrite(&smlen, sizeof(unsigned long long), 1, file);

  fclose(file);
  
  for(j=0;j<CRYPTO_PUBLICKEYBYTES;j++)
	pk[j] = fgetc(urandom);
  for(j=0;j<MLEN+CRYPTO_BYTES;j++)
	sm[j] = fgetc(urandom);
  smlen = fgetc(urandom);

  fclose(urandom);
}

void read_file(char* filename)
{
  int r;

  FILE *file;
  file=fopen(filename,"rb");
  if(file == NULL)
	printf("Unable to open file!\n");

  r = fread(pk, 1, CRYPTO_PUBLICKEYBYTES, file);
  r = fread(sm, 1, MLEN+CRYPTO_BYTES, file);
  r = fread(&smlen, sizeof(unsigned long long), 1, file);

  fclose(file);

  r = crypto_sign_open(mo, &mlen, sm, smlen, pk);

  if(r==0)
  	printf("Test passed.\n");
  else
	printf("Test failed!\n");
}

int main()
{
  create_file("test_avx2.bin");
  read_file("test_arm.bin");

  return 0;
}


