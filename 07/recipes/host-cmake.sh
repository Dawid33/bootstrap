#!/bin/sh
set -uex

rm -rf /tmp/host-cmake
mkdir -p /tmp/host-cmake; cd /tmp/host-cmake
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/cmake-3.27.4.tar.gz
./configure --prefix=/usr -- -DCMAKE_USE_OPENSSL=OFF
make
make install





