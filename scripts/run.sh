#!/bin/sh

# cd 05 && make 2>&1 | less -R +F 

# TESTING=2b4-gnugcc13
# TESTING=2b5-m4
# TESTING=2b6-grep
# TESTING=2b7-gawk
# TESTING=2b8-bison
# TESTING=2b9-binutils
# TESTING=2c0-glibc
# TESTING=3c1-zlib
# TESTING=2c2-pkg-config
# TESTING=2c3-perl
# TESTING=2c3-openssl
TESTING=2c4-mrustc
# TESTING=3b-busybox-static
# TESTING=2a8-python
# TESTING=2c5-rust

cd 06
cp recipes/$TESTING.sh stage/recipes/$TESTING.sh

unshare -nrm <<EOF
  export NPROC=16
  mkdir -p stage/dev/shm;
  mkdir -p stage/dev; :> stage/dev/null
  mount --bind /dev/null stage/dev/null
  mount -t tmpfs tmpfs stage/dev/shm
  chroot stage /recipes/$TESTING.sh 2>&1 | less +F
EOF
