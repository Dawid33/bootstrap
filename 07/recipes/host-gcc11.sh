#!/bin/sh
set -uex

rm -rf /tmp/host-gcc11
mkdir -p /tmp/host-gcc11; cd /tmp/host-gcc11
mkdir gmp mpfr mpc
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/gcc-11.4.0.tar.xz
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/gmp-6.3.0.tar.xz -C gmp
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/mpfr-4.2.1.tar.xz -C mpfr
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/mpc-1.3.1.tar.gz -C mpc

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
mkdir -p /tmp/host-gcc11/prefix 
./configure \
  --prefix=/tmp/host-gcc11/prefix \
  --enable-default-pie                           \
  --enable-default-ssp                           \
  --disable-nls                                  \
  --disable-multilib                             \
  --disable-multiarch \
  --disable-libatomic                            \
  --disable-libgomp                              \
  --disable-libquadmath                          \
  --disable-libsanitizer                         \
  --disable-libssp                               \
  --disable-libvtv                               \
  --disable-bootstrap                            \
  --disable-dependency-tracking \
  --enable-languages=c,c++
export MAKEFLAGS="-j 8"
make 
make install
