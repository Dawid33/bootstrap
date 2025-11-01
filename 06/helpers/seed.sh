#!/bin/sh
set -uex

mkdir -p stage/store
cp -raL --reflink=auto downloads recipes stage/

# I'm too lazy to pass it through stage1
sed -i "s|\$NPROC|$NPROC|" stage/recipes/*.sh

cp ../05/tcc-final/out/tcc tcc-seed

DESTDIR=stage ash recipes/0-tcc-seed/seed.host-executed.sh  # copy tcc-seed
DESTDIR=stage ash recipes/1-stage1/seed.host-executed.sh    # unpack stage1 sources
