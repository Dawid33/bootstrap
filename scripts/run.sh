#!/bin/sh

# cd 05 && make 2>&1 | less -R +F 


# TESTING=2c4-binutils
# TESTING=2c1-gcc-intermediate
# TESTING=2c0-glibc
# TESTING=2c1-libstdc++
# TESTING=2c1-crosstools
# TESTING=2c1-binutils
# TESTING=2c1-gcc
# cd 06
# cp recipes/$TESTING.sh stage/recipes/$TESTING.sh
# cp recipes/buildroot.config stage/recipes/buildroot.config

# unshare -nrm <<EOF
#   export NPROC=16
#   mkdir -p stage/dev/shm;
#   mkdir -p stage/dev; :> stage/dev/null
#   mount --bind /dev/null stage/dev/null
#   mount -t tmpfs tmpfs stage/dev/shm
#   chroot stage /recipes/$TESTING.sh 2>&1 | less +F
# EOF

# cd 06;
# ../busybox ash ./ci_stage1.sh 2>&1 | less +F

# ./busybox ash ./initboot.sh 2>&1 | less +F

cd 07;
# TESTING=all-stages
# TESTING=host-cpio
# TESTING=host-bzip2
# TESTING=host-tar
# TESTING=host-busybox
# TESTING=host-gettext
# TESTING=host-bison
# TESTING=host-perl
TESTING=host-python
# TESTING=host-texinfo
# TESTING=host-util-linux
# TESTING=host-cmake
# TESTING=host-zlib
# TESTING=host-pkg-config
# TESTING=temp-mrustc
# cp recipes/$TESTING.sh fs/tmp/recipes/$TESTING.sh

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
      MAKEFLAGS="-j$($NPROC)"      \
      TESTSUITEFLAGS="-j$($NPROC)" \
      /bin/bash --login /tmp/recipes/$TESTING.sh 2>&1 | less +F
EOF
