set -uex
export NPROC=10
export SOURCE_DATE_EPOCH=0
../busybox chroot ./stage $1

