# Extending GPG with Tightly-secure efficient signatures from standard lattices (Tesla)
As part of our studies at the "Technische Universität Darmstadt", Germany, we added cryptographic primitives (signature and encryption scheme) to the *Gnu Privacy Guard* (GPG) software. More specifically, we integrated a lattice-based signature scheme [1] and (lateron) an encryption scheme to GPG.

To this end, we worked our way through the documentation and code of GPG. In this repository we commited the steps we performed in order to integrate the new algorithms. A detailed description of the general steps necessary to add a new public key algorithm to GPG, that was created in this project, is also available in [this repository](docs/adding-a-new-pk-algorithm-to-gpg.pdf).

This repository is based on GPG and Libgcrypt cloned at 24<sup>th</sup> November 2015 from (git://git.gnupg.org/gnupg.git) and (git://git.gnupg.org/libgcrypt.git). However, as the lattice-based encryption scheme is not officially published yet, the code for encryption scheme cannot be found on in this reposity. It will be added as soon the paper is published. 

Please note that the implementation's main focus was a proof of concept. Thus, we do not guarantee that the performed modifications are completely secure against side-channel attacks, buffer overflow attacks etc. We also do not recommend to modify your GPG on your own unless you are knowing what you are doing, since it could undermine your security.

Comments, questions, and feedback is very welcomed.


[1]: S. Akleylek, N. Bindel, J. Buchmann, J. Krämer, and G. A. Marson, "An efficient lattice-based signature scheme with provably secure instantiation", in International Conference on Cryptology - AFRICACRYPT 2016 (D. Pointcheval, T. Rachidi, and A. Nitaj, eds.), pp. 44-60, Springer, 2016.
