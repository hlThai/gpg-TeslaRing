#ifndef CRYPTO_STREAM_CHACHA20
#define CRYPTO_STREAM_CHACHA20

#define crypto_stream_chacha20_KEYBYTES 32
#define crypto_stream_chacha20_NONCEBYTES 8

int crypto_stream_chacha20(unsigned char *c,unsigned long long clen, const unsigned char *n, const unsigned char *k);

#endif
