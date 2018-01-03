apt-get source libssl-dev

./Configure linux-armv4

modify Makefile CC=musl-gcc

make

make install

import here
