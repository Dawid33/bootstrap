#!/bin/sh
set -uex

rm -rf /tmp/host-util-linux
mkdir -p /tmp/host-util-linux; cd /tmp/host-util-linux
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/util-linux-2.40.4.tar.gz
mkdir -pv /var/lib/hwclock
export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
./configure --libdir=/usr/lib     \
            --runstatedir=/run    \
            --disable-chfn-chsh   \
            --disable-login       \
            --disable-nologin     \
            --disable-su          \
            --disable-setpriv     \
            --disable-runuser     \
            --disable-pylibmount  \
            --disable-static      \
            --disable-liblastlog2 \
            --without-python      \
            --disable-use-tty-group \
            ADJTIME_PATH=/var/lib/hwclock/adjtime
make
make install
