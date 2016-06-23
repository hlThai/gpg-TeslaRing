CC = /usr/bin/gcc
CFLAGS = -msse2avx -march=corei7-avx -O3 -fomit-frame-pointer -g -Wall -Wextra
PYTHON3 = python3
QHASM = ../../tools/qhasm/qhasm-amd64avx
#-msse2avx -march=corei7-avx 

SOURCE = crypto_hash_sha256.c sign.c keypair.c cpucycles.c consts.c oracle.c matrix.c mul_mn_uniQ_n_uniB.s mul_mn_uniQ_n_uniB3x.s compress_v.s mul_mk_gauss_m_sparse_subred.s crypto_stream_chacha20.c chacha.S
SOURCE += gauss/samplers/rejection_ber_independent/rej_ber_independent.c gauss/rnd/random.c

HEADER = api.h crypto_hash_sha256.h crypto_sign.h randombytes.h cpucycles.h params.h gauss/samplers/rejection_ber_independent/rej_ber_independent_table.data oracle.h matrix.h

#Get the sigma from the param.h file to generate the sampler table
SIGMA ?= $$(/usr/bin/gcc -dM -E params.h | grep "PARAM_SIGMA " |awk '{ print $$3}')
TAIL ?= 13

PRECISION ?= 80

all: test/test_sign \
	   test/testvectors \
	   test/speed \

test/test_sign: $(SOURCE) $(HEADER)  test/test_sign.c mat_At.c randombytes.c
	$(PYTHON3) gauss/samplers/rejection_ber_independent/gen_ber_table.py $(SIGMA) $(TAIL) $(PRECISION) > gauss/samplers/rejection_ber_independent/rej_ber_independent_table.data
	$(CC) $(CFLAGS) $(SOURCE) mat_At.c test/test_sign.c  -lm -o $@  randombytes.c

test/testvectors: $(SOURCE) $(HEADER)  test/testvectors.c mat_At.c
	$(PYTHON3) gauss/samplers/rejection_ber_independent/gen_ber_table.py $(SIGMA) $(TAIL) $(PRECISION) > gauss/samplers/rejection_ber_independent/rej_ber_independent_table.data
	$(CC) $(CFLAGS) $(SOURCE) mat_At.c test/testvectors.c  -lm -o $@ 

test/speed: $(SOURCE) $(HEADER) test/speed.c mat_At.c randombytes.c
	$(CC) $(CFLAGS) $(SOURCE) mat_At.c test/speed.c  -lm -o $@  randombytes.c 

precompute_At: crypto_stream_chacha8.c precompute_At.c gauss/samplers/rejection_ber_independent/rej_ber_independent.c gauss/rnd/random.c randombytes.c crypto_stream_chacha20.c chacha.S
	$(PYTHON3) gauss/samplers/rejection_ber_independent/gen_ber_table.py $(SIGMA) $(TAIL) $(PRECISION) > gauss/samplers/rejection_ber_independent/rej_ber_independent_table.data
	$(CC) $(CFLAGS) $^ -lm -o $@ 

mat_At.c: precompute_At
	./precompute_At > mat_At.c

compress_v.q: compress_v.py
	./compress_v.py > $@
mul_mn_uniQ_n_uniB3x.q: gen_mul_mn_uniQ_n_uniB3x.py
	./gen_mul_mn_uniQ_n_uniB3x.py > $@

mul_mn_uniQ_n_uniB.q: gen_mul_mn_uniQ_n_uniB.py
	./gen_mul_mn_uniQ_n_uniB.py > $@

mul_mk_gauss_m_sparse_subred.q: gen_mul_mk_gauss_m_sparse_subred.py
	./gen_mul_mk_gauss_m_sparse_subred.py > $@

%.s: %.q
	$(QHASM) < $^ > $@

.PHONY: clean

clean:
	-rm -f *.o
	-rm -f *.q
	-rm -f *.pyc
	-rm -f mul*.s
	-rm -f comp*.s
	-rm -f test/test_sign
	-rm -f test/speed
	-rm -f test/testvectors
	-rm -f precompute_At
	-rm -f mat_At.c
