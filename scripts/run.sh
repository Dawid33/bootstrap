#!/bin/sh

# cd 05 && make 2>&1 | less -R +F 


TESTING=2c1-buildroot
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

# cd 07;
# ./build.sh 2>&1 | less +F
