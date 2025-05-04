#!/bin/sh
set -uex

rm -rf /tmp/host-busybox
mkdir -p /tmp/host-busybox; cd /tmp/host-busybox
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/busybox-1.37.0.tar.bz2

export PATH="/bin:/sbin:/usr/bin:/usr/sbin"
make defconfig
make 
make CONFIG_PREFIX=/usr/busybox install
