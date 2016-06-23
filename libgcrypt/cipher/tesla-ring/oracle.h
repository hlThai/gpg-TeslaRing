#ifndef ORACLE_H
#define ORACLE_H

#include "../tesla-ring/params.h"

void random_oracle(unsigned char *c_bin,  double v[PARAM_M], const unsigned char *m, unsigned long long mlen);

#endif
