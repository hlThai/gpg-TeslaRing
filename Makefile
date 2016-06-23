folder=gpg2lattice
P=$(CURDIR)/$(folder)
all: createFolder compileAll gpgAgent keygen

compileAll:libgpgerror libgcrypt gnupg
createFolder:
	mkdir -p $(folder)

libgpgerror: FORCE
	cd libgpg-error-1.21;./configure --prefix=$(P);make;make install
	
libgcrypt: prepareLibgcrypt makeLibgcrypt

prepareLibgcrypt: FORCE
	cd libgcrypt;./autogen.sh;./configure --prefix=$(P) --with-gpg-error-prefix=$(P) --enable-maintainer-mode --enable-static --disable-shared

makeLibgcrypt: FORCE
	cd libgcrypt;make clean;make;make;make install
	
gnupg: preparegnupg makeGnupg

preparegnupg: FORCE
	cd gnupg;export LD_LIBRARY_PATH=$(P)/lib/;./autogen.sh;./configure --prefix=$(P) --with-gpg-error-prefix=$(P) --with-libgcrypt-prefix=$(P) --enable-maintainer-mode --enable-huge-secmem;

makeGnupg: FORCE
	cd gnupg;export LD_LIBRARY_PATH=$(P)/lib/;make;make install

gpgAgent: FORCE
	$(P)/bin/gpg-agent --daemon --write-env-file ./.gpg-agent-info --enable-ssh-support --debug-all --allow-preset-passphrase --verbose --log-file ./gpg-agent-verbose.lo

keygen: FORCE
	$(P)/bin/gpg2 --gen-key

easyKeygen: FORCE
	$(P)/bin/gpg2 --batch --gen-key $(CURDIR)/gpgConfig
	
dsaKeygen: FORCE
	$(P)/bin/gpg2 --batch --gen-key $(CURDIR)/gpgConfigDSA

default: makeLibgcrypt makeGnupg gpgAgent easyKeygen

FORCE:
