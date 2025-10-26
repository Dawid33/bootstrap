#!/usr/bin/env bash
set -uex

../busybox rm -rf stage/store
../busybox rm -rf stage/tmp
../busybox rm -rf stage/recipes
../busybox rm -rf stage/downloads

../busybox mkdir -p stage/store
../busybox cp -raL --reflink=auto downloads recipes stage/

# I'm too lazy to pass it through stage1
../busybox sed -i "s|\$NPROC|$NPROC|" stage/recipes/*.sh

../busybox cp ../05/tcc-final/out/tcc tcc-seed

DESTDIR=stage ../busybox ash recipes/0-tcc-seed/seed.host-executed.sh  # copy tcc-seed
DESTDIR=stage ../busybox ash recipes/1-stage1/seed.host-executed.sh    # unpack stage1 sources
