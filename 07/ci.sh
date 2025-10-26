#!/bin/sh

set -uex
NPROC=10
export SOURCE_DATE_EPOCH=0
export PS1='(chroot) \u:\w\$ '
export TERM="xterm"
export PATH=/usr/bin:/usr/sbin    
export TESTSUITEFLAGS="-j$NPROC"
export NPROC="$NPROC"
/usr/local/bin/proot --rootfs=$(pwd)/07/fs \
    --bind=/dev \
    --bind=/etc \
    --bind=/proc -w / -0 /bin/bash --login /tmp/recipes/$1

# set -uex
# export NPROC=10
# export SOURCE_DATE_EPOCH=0
# ../busybox chroot "fs" /usr/bin/env -i   \
#     HOME=/root                  \
#     PS1='(chroot) \u:\w\$ ' \
#     TERM="xterm" \
#     PATH=/usr/bin:/usr/sbin     \
#     TESTSUITEFLAGS="-j$NPROC" \
#     NPROC="$NPROC" \
#     /bin/bash --login /tmp/recipes/$1.sh 
