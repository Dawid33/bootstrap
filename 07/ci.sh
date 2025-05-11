#!/bin/sh

TESTING="$1"
export NPROC=16
unshare -nrm <<EOF
  mkdir -p fs/dev/shm;
  mkdir -p fs/dev; :> fs/dev/null
  mount --bind /dev/null fs/dev/null
  mount -t tmpfs tmpfs fs/dev/shm
  env -i "NPROC=$NPROC" unshare -nrm ../busybox chroot "fs" /usr/bin/env -i   \
      HOME=/root                  \
      PS1='(chroot) \u:\w\$ ' \
      TERM="xterm" \
      PATH=/usr/bin:/usr/sbin     \
      TESTSUITEFLAGS="-j$($NPROC)" \
      NPROC="$NPROC" \
      /bin/bash --login /tmp/recipes/$TESTING.sh 2>&1 | less +F
EOF
