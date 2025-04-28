#!/usr/bin/env bash

# This is the straigthforward bootstrapping way.
# Prepare a directory with the initial TinyCC compiler, and a ton of sources.
# Then exec into it and let it bootstrap itself.

# You can refer to the Makefile for a more refined, totally optional approach
# with incremental builds, better build isolation etc.

set -uex

export NPROC=$(nproc --all)

cp ../05/tcc-final/tcc tcc-seed

if [[ ! -e tcc-seed ]]; then
	echo 'You need to supply a statically linked TinyCC as `tcc-seed`.'
	echo -n 'You can `./compile-tcc-seed-with-nix.sh` '
	echo 'if you have `nix` and trust in me.'
	exit 1
fi

# Create a stage directory
mkdir -p stage

# Download all the required source files
./download.sh

# Inject initial tcc and our scripts; pre-unpack and patch stage 1 sources,
# in a separate file because it makes sense to run it separately sometimes.
./seed.sh

/store/0-tcc-seed -I /protosrc/tinycc/include -nostdinc -nostdlib -Werror -run /recipes/1-stage1.c

