#include <stdint.h>

#include "../../tesla-ring/avx2/crypto_stream_chacha20.h"
#include "../../tesla-ring/avx2/params.h"

//Contains S and E
#define CRYPTO_SECRETKEYBYTES (sizeof(uint16_t)*PARAM_N*PARAM_K+sizeof(uint16_t)*PARAM_M*PARAM_K)+32

//Contains T
#define CRYPTO_PUBLICKEYBYTES (sizeof(uint32_t)*PARAM_M*PARAM_K)

//Contains z (bounded by B) and a hash
#define CRYPTO_BYTES (3*PARAM_N+32)
