#ifndef MATRIX_H
#define MATRIX_H

#include "../../tesla-ring/avx2/matrix.h"

#include "../../tesla-ring/avx2/params.h"

void vector_add_n(double *r, const double *x, const double *y);

void matrix_mul_mnk(double *r, const double *x, const double *y);

void matrix_add_mk(double *r, const double *x, const double *y);

void mul_mk_gauss_m_sparse_subred(double res[PARAM_M], const unsigned char *pke, const uint32_t pos_list[PARAM_W], const double sign_list[PARAM_W]);

void mul_mn_uniQ_n_uniB(double res[PARAM_M], const double b[PARAM_N], const int32_t a[PARAM_N][PARAM_M]);

void mul_mn_uniQ_n_uniB4x(double *res, const double *b, int32_t a[PARAM_N][PARAM_M]);

#endif
