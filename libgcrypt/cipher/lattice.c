/* lattice.c  -  Lattice Based Cryptography
 * Copyright (C) 2016 Christian Klos, Hong Linh Thai
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

#include <config.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <string.h>
#include <inttypes.h>

#include "g10lib.h"
#include "mpi.h"
#include "cipher.h"
#include "pubkey-internal.h"
#include "tesla-ring/crypto_sign.h"
#include "tesla-ring/params.h"
#include "tesla-ring/api.h"

static const char *lattice_names[] =
  {
    "lattice",
    "openpgp-lattice",
    NULL,
  };

// check the key pair by sigining and verifying a test message
static gcry_err_code_t
checkGeneratedKey(unsigned char* pk,unsigned char* sk)
{
	int r;
	int MLEN = 5;
	unsigned char mi[MLEN];
	unsigned char sm[MLEN+CRYPTO_BYTES];
	unsigned char mo[MLEN+CRYPTO_BYTES];

	unsigned long long smlen;
	unsigned long long mlen;

	mi[1] = 't';
	mi[2] = 'e';
	mi[3] = 's';
	mi[4] = 't';
	mi[5] = '\0';

	crypto_sign(sm, &smlen, mi, MLEN, sk);
    r = crypto_sign_open(mo, &mlen, sm, smlen, pk);
    if(r) {
    	printf("verify function failed\n");
    	return r;
    }

    return memcmp(mi,mo,MLEN);
}

/*********************************************
 **************  interface  ******************
 *********************************************/
static gcry_err_code_t
lattice_generate (const gcry_sexp_t genparms, gcry_sexp_t *r_skey)
{
	int r;
	gpg_err_code_t ec;

	unsigned char *pk = NULL;
	unsigned char *sk = NULL;

	gcry_mpi_t e = NULL;
	gcry_mpi_t d = NULL;

	// allocating memory for the pk and sk
	pk = xtrymalloc_secure (CRYPTO_PUBLICKEYBYTES);
	if (!pk)
	{
		ec = gpg_err_code_from_syserror ();
		goto leave;
	}

	sk = xtrymalloc_secure (CRYPTO_PUBLICKEYBYTES);
	if (!sk)
	{
		ec = gpg_err_code_from_syserror ();
		goto leave;
	}

	// create keypair
	r = crypto_sign_keypair(pk, sk);
	if (r) {
		printf("Error while trying to generate a lattice-based signature key: keypair could not be generated\n");
		goto leave;
	}
	ec = checkGeneratedKey(pk, sk);
	if(ec) {
		printf("Error while trying to generate a lattice-based signature key: Test signature could not be verified\n");
		goto leave;
	}

	ec = _gcry_mpi_scan (&e, GCRYMPI_FMT_USG, pk, CRYPTO_PUBLICKEYBYTES, NULL);
	if(ec) {
		printf("Error while trying to generate a lattice-based signature key: Key could be converted into MPI\n");
		goto leave;
	}

	ec = _gcry_mpi_scan (&d, GCRYMPI_FMT_USG, sk, CRYPTO_SECRETKEYBYTES, NULL);
	if(ec) {
		printf("Error while trying to generate a lattice-based signature key: Key could be converted into MPI\n");
		goto leave;
	}

	// building s-exp of the pk and sk
	ec = sexp_build(r_skey, NULL,
		  "(key-data"
		  " (public-key"
          "  (lattice(e%m)))"
		  " (private-key"
          "  (lattice(e%m)(d%m)))"
		  ")",
		  e,e,d);

	leave:
	// free memory
	_gcry_mpi_release(e);
	_gcry_mpi_release(d);
	xfree(sk);
	xfree(pk);

	return ec;
}

static gcry_err_code_t
lattice_check_secret_key (gcry_sexp_t keyparms)
{
	gcry_err_code_t rc;
	gcry_mpi_t e = NULL;
	gcry_mpi_t d = NULL;

	// buffer for secret key
	unsigned char *sk;
	// buffer for public key
	unsigned char *pk;

	int mpiLen;
	if( DBG_CIPHER )
		printf("check secret key of lattice was called\n");

	// Extract the Key from the s-expression
	rc = _gcry_sexp_extract_param (keyparms, NULL, "ed", &e,&d, NULL);
	if (rc)
		goto leave;

	// decoding pk to normal char array
	pk = xtrymalloc_secure (CRYPTO_PUBLICKEYBYTES);
	if (!pk)
	{
		rc = gpg_err_code_from_syserror ();
		printf("Memory allocation failed\n");
		goto leave;
	}
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, pk, CRYPTO_PUBLICKEYBYTES, &mpiLen, e);
	if (rc)
		goto leave;

	// decoding sk to normal char array
	sk = xtrymalloc_secure (CRYPTO_SECRETKEYBYTES);
	if (!sk)
	{
		rc = gpg_err_code_from_syserror ();
		printf("Memory allocation failed\n");
		goto leave;
	}
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, sk, CRYPTO_SECRETKEYBYTES, &mpiLen, d);
	if (rc)
		goto leave;

   rc = check_lattice_secret_key(pk, sk);

   leave:
   // free memory
   _gcry_mpi_release(e);
   _gcry_mpi_release(d);
	xfree(sk);
	xfree(pk);

   return rc;
}


static gcry_err_code_t
lattice_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_data, gcry_sexp_t keyparms)
{
	struct pk_encoding_ctx ctx;
	gcry_err_code_t rc;
	gcry_mpi_t data = NULL;
	gcry_mpi_t sig_s = NULL;

	// Key Parameters
	gcry_mpi_t e = NULL; // public key
	gcry_mpi_t d = NULL; // private key

	// buffer for message
	unsigned char *mi;
	unsigned long long mlen;

	// buffer for signature
	unsigned char *sm;
	unsigned long long smlen;

	// buffer for secret key
	unsigned char *sk;
	// buffer for public key
	unsigned char *pk;

	// length of the message
	size_t MLEN;

	// Get Key Params
	 _gcry_pk_util_init_encoding_ctx (&ctx, PUBKEY_OP_SIGN,0);

	// Get the data
	rc = _gcry_pk_util_data_to_mpi (s_data, &data, &ctx);

	// get the size of the data to sign
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, NULL, 0, &MLEN, data);

	// allocate a char array buffer for the data to sign
	mi = xtrymalloc (MLEN);
	if (!mi)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}
	// convert the data to char array
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, mi , MLEN, NULL, data);

	if (rc)
	    goto leave;
	if (DBG_CIPHER)
		log_mpidump ("lattice_sign   data", data);

	// Extract the Key from the s-expression
	rc = _gcry_sexp_extract_param (keyparms, NULL, "ed", &e,&d, NULL);

	if (rc)
		goto leave;
	if (DBG_CIPHER)
		{
		  log_mpidump ("lattice_sign      e", e);
		  log_mpidump ("lattice_sign      d", d);
		}

	// decoding sk to normal char array
	sk = xtrymalloc_secure (CRYPTO_SECRETKEYBYTES);
	if (!sk)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, sk, CRYPTO_SECRETKEYBYTES, NULL, d);

	// decoding pk to normal char array
	pk = xtrymalloc_secure (CRYPTO_PUBLICKEYBYTES);
	if (!pk)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, pk, CRYPTO_PUBLICKEYBYTES, NULL, e);

	// allocate data for the signature
	sig_s = mpi_new (0);
	sm = xtrymalloc (MLEN+CRYPTO_BYTES);
	if (!sm)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}

	// create the signature
	rc = crypto_sign(sm, &smlen, mi, MLEN, sk);
	if(rc) {
		printf("error at sign function\n");
		goto leave;
	}

	rc = _gcry_mpi_scan (&sig_s, GCRYMPI_FMT_USG, sm, smlen, NULL);
	if(rc) {
		printf("error with error code: %i\n", rc);
		goto leave;
	}

	if (DBG_CIPHER) {
		log_mpidump ("lattice_sign  sig_s", sig_s);
	}

	rc = sexp_build (r_sig, NULL, "(sig-val(lattice(s%m)))", sig_s);

	leave:
    _gcry_mpi_release (sig_s);
    _gcry_mpi_release (e);
    _gcry_mpi_release (d);
    _gcry_mpi_release (data);
	xfree(sm);
	xfree(mi);
	xfree(sk);
	xfree(pk);
	_gcry_pk_util_free_encoding_ctx (&ctx);

	if (DBG_CIPHER)
	    log_debug ("lattice_sign      => %s\n", gpg_strerror (rc));
	return rc;
}

static gcry_err_code_t
lattice_verify (gcry_sexp_t s_sig, gcry_sexp_t s_data, gcry_sexp_t s_keyparms)
{
	struct pk_encoding_ctx ctx;
	gcry_err_code_t rc;
	gcry_mpi_t data = NULL;
	gcry_sexp_t l1 = NULL;
	gcry_mpi_t sig_s = NULL;

	// Key Parameters
	gcry_mpi_t e = NULL; // public key

	// buffer for message
	unsigned char *mi;
	unsigned char *mo;

	// buffer for signature
	unsigned char *sm;
	unsigned long long smlen;
	unsigned long long mlen;

	// buffer for public key
	unsigned char *pk;

	// length of the data to verify
	size_t MLEN;

	// Get Key Params
	_gcry_pk_util_init_encoding_ctx (&ctx, PUBKEY_OP_VERIFY,0);

	// Get the data
	rc = _gcry_pk_util_data_to_mpi (s_data, &data, &ctx);
	// Convert the data to char array
	// get the size of the message to verify
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, NULL, 0, &MLEN, data);

	if (rc)
	    goto leave;

	// allocate a char array buffer for the data to sign
	mi = xtrymalloc (MLEN);
	if (!mi)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}
	// convert the data to char array
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, mi , MLEN, 0, data);
	if (rc)
	    goto leave;
	if (DBG_CIPHER)
		log_mpidump ("lattice_verify   data", data);

	/* Extract the signature value.  */
	rc = _gcry_pk_util_preparse_sigval (s_sig, lattice_names, &l1, NULL);
	if (rc)
	    goto leave;
	rc = _gcry_sexp_extract_param (l1, NULL, "s", &sig_s, NULL);
	if (rc)
	    goto leave;
	if (DBG_CIPHER)
	{
	      log_mpidump ("lattice_verify  s_s", sig_s);
	}

	// convert the signature to char array
    // get the size of the signature
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, NULL, 0, &smlen, sig_s);

	// allocate a char array buffer for the signed message
	sm = xtrymalloc (smlen);
	if (!sm)
	{
			rc = gpg_err_code_from_syserror ();
		    printf("Memory allocation failed\n");
		    goto leave;
	}
	// convert the signature to char array
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, sm , smlen, 0, sig_s);

	// Extract the Key from the s-expression
	rc = _gcry_sexp_extract_param (s_keyparms, NULL, "e",
	                                 &e, NULL);
	if (rc)
		goto leave;
	if (DBG_CIPHER)
		{
		  log_mpidump ("lattice_sign      e", e);
		}

	// decoding pk to normal char array
	pk = xtrymalloc_secure (CRYPTO_PUBLICKEYBYTES);
	if (!pk)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}
	rc = _gcry_mpi_print (GCRYMPI_FMT_USG, pk, CRYPTO_PUBLICKEYBYTES, NULL, e);

	// allocating memory for the opened message
	mo = xtrymalloc (MLEN);
	if (!mo)
	{
		rc = gpg_err_code_from_syserror ();
	    printf("Memory allocation failed\n");
	    goto leave;
	}

	// call the method which opens the signature from lattice-based signatures
	rc = crypto_sign_open(mo, &mlen, sm, smlen, pk);
	// check if both messages are identical
	rc = memcmp(mi,mo,MLEN);

	leave:
	_gcry_pk_util_free_encoding_ctx (&ctx);
	_gcry_mpi_release (data);
	_gcry_mpi_release (s_sig);
	_gcry_mpi_release (e);
	xfree(pk);
	xfree(sm);
	xfree(mi);
	xfree(mo);
	sexp_release (l1);

	return rc;
}


static unsigned int
lattice_get_nbits (gcry_sexp_t parms)
{
	return CRYPTO_PUBLICKEYBYTES;
}

static gpg_err_code_t
compute_keygrip (gcry_md_hd_t md, gcry_sexp_t keyparam)
{
  gcry_sexp_t l1;
  const char *data;
  size_t datalen;

  l1 = sexp_find_token (keyparam, "e", 1);
  if (!l1)
    return GPG_ERR_NO_OBJ;

  data = sexp_nth_data (l1, 1, &datalen);
  if (!data)
    {
      sexp_release (l1);
      return GPG_ERR_NO_OBJ;
    }

  _gcry_md_write (md, data, datalen);
  sexp_release (l1);

  return 0;
}

/* Run a full self-test for ALGO and return 0 on success.  */
static gpg_err_code_t
run_selftests (int algo, int extended, selftest_report_func_t report)
{
	return 0;
}

gcry_pk_spec_t _gcry_pubkey_spec_lattice =
  {
	GCRY_PK_LATTICE, { 0, 1 },
    GCRY_PK_USAGE_SIGN,
    "LATTICE", lattice_names,
    "e", "ed", "a", "s", "e",
    lattice_generate,
	lattice_check_secret_key,
    NULL,
    NULL,
    lattice_sign,
    lattice_verify,
	lattice_get_nbits,
    run_selftests,
	compute_keygrip
  };
