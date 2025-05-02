#!/bin/sh

# cd 05 && make 2>&1 | less -R +F 

# TESTING=2b5-m4
# TESTING=2b6-grep
# TESTING=2b7-gawk
# TESTING=2b8-bison
# TESTING=2b9-binutils
# TESTING=2c0-glibc
# TESTING=2c2-pkg-config
# TESTING=2c3-openssl
# TESTING=2b4-gnugcc13
# TESTING=2c4-automake
# TESTING=2c4-autoconf
# TESTING=2c4-patchelf
# TESTING=2c4-mrustc
# TESTING=3b-busybox-static
# TESTING=2a8-python
# TESTING=2c5-rust
# TESTING=binutils
# TESTING=linux-headers
# TESTING=glibc
# TESTING=gnugcc13
 
# TESTING=2c3-perl
# TESTING=2c0-libtool
TESTING=2c1-gettext
# TESTING=2b9-flex
# TESTING=2c1-coreutils
# TESTING=2c1-zlib
# TESTING=2c1-zstd
# TESTING=2c1-xxhash
# TESTING=2c1-rsync
# TESTING=2c1-buildroot
# TESTING=2c1-find
# TESTING=2c1-patch
# TESTING=2b11-file
# TESTING=2b0-musl
# TESTING=2b10-bash
# TESTING=2b4-gnugcc13
# TESTING=2b9-gnu-triplet-cross

# TESTING=2b9-binutils
# TESTING=2c0-glibc
# TESTING=2c1-libstdc++
# TESTING=2c1-binutils

cd 06
cp recipes/$TESTING.sh stage/recipes/$TESTING.sh
cp recipes/buildroot.config stage/recipes/buildroot.config

unshare -nrm <<EOF
  export NPROC=16
  mkdir -p stage/dev/shm;
  mkdir -p stage/dev; :> stage/dev/null
  mount --bind /dev/null stage/dev/null
  mount -t tmpfs tmpfs stage/dev/shm
  chroot stage /recipes/$TESTING.sh 2>&1 | less +F
EOF

# cd 06;
# ../busybox ash ./ci_stage1.sh 2>&1 | less +F

# ./busybox ash ./initboot.sh 2>&1 | less +F
