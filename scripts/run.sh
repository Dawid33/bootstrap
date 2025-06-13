#!/bin/bash
set -uex

RUST_BACKTRACE=1 cargo run --target=x86_64-unknown-linux-musl --manifest-path strap/Cargo.toml --color=always 2>&1 run tcc-bootstrap 0.0.0 build | less -R +F 


# cd 05 && make 2>&1 | less -R +F 
# TESTING=2c4-binutils
# TESTING=2c1-gcc-intermediate
# TESTING=2c0-glibc
# TESTING=2c1-libstdc++
# TESTING=2c1-crosstools
# TESTING=2c1-binutils
# TESTING=2c1-gcc
# TESTING=2b4-gnugcc13
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

# TESTING=all-stages
# TESTING=host-python
# TESTING=host-cpio
# TESTING=host-bzip2
# TESTING=host-tar
# TESTING=host-busybox
# TESTING=host-gettext
# TESTING=host-bison
# TESTING=host-perl
# TESTING=host-texinfo
# TESTING=host-util-linux
# TESTING=host-cmake
# TESTING=host-zlib
# TESTING=host-pkg-config
# TESTING=host-gdb
# TESTING=host-openssl
# TESTING=temp-mrustc
# TESTING=temp-rust-1.76
# TESTING=temp-rust-1.77
# TESTING=temp-rust-1.78
# TESTING=temp-rust-1.79
# TESTING=temp-rust-1.80
# TESTING=temp-rust-1.81
# TESTING=temp-rust-1.82
# TESTING=temp-rust-1.83
# TESTING=temp-rust-1.84
# TESTING=temp-rust-1.85
# TESTING=temp-rust-1.86
# cd 07;
# cp recipes/$TESTING.sh fs/tmp/recipes/$TESTING.sh

# export NPROC=16
# unshare -nrmfp /bin/bash --noprofile <<EOF
#     mkdir -p fs/dev/shm;
#     mkdir -p fs/proc;
#     mkdir -p fs/dev; :> fs/dev/null
#     mkdir -p fs/dev/shm

#     mount -t tmpfs tmpfs fs/dev/shm
#     mount --bind /dev/null fs/dev/null
#     mount -tproc none fs/proc;
#     env -i "NPROC=$NPROC" unshare -nrm ../busybox chroot "fs" /usr/bin/env -i   \
#         HOME=/root                  \
#         PS1='(chroot) \u:\w\$ ' \
#         TERM="xterm" \
#         PATH=/usr/bin:/usr/sbin     \
#         TESTSUITEFLAGS="-j$($NPROC)" \
#         NPROC="$NPROC" \
#         /bin/bash --login /tmp/recipes/$TESTING.sh 2>&1 | less +F
# EOF

