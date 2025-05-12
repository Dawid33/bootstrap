#!/bin/sh

set -uex
export NPROC=10
export SOURCE_DATE_EPOCH=0
# mkdir -p /proc
# mkdir -p fs/dev/shm;
# mkdir -p fs/dev; :> fs/dev/null
# mount --bind /dev/null fs/dev/null
# mount -t tmpfs tmpfs fs/dev/shm
../busybox chroot "fs" /usr/bin/env -i   \
    HOME=/root                  \
    PS1='(chroot) \u:\w\$ ' \
    TERM="xterm" \
    PATH=/usr/bin:/usr/sbin     \
    TESTSUITEFLAGS="-j$NPROC" \
    NPROC="$NPROC" \
    /bin/bash --login /tmp/recipes/$1.sh 
