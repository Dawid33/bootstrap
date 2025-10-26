#!/usr/bin/env bash

# This is the straigthforward bootstrapping way.
# Prepare a directory with the initial TinyCC compiler, and a ton of sources.
# Then exec into it and let it bootstrap itself.

# You can refer to the Makefile for a more refined, totally optional approach
# with incremental builds, better build isolation etc.

set -uex

export NPROC=10

../busybox cp ../05/tcc-final/out/tcc tcc-seed
./tcc-seed --help

# Create a stage directory
../busybox mkdir -p stage

# Download all the required source files
../busybox ash ./download.sh

# Inject initial tcc and our scripts; pre-unpack and patch stage 1 sources,
# in a separate file because it makes sense to run it separately sometimes.
../busybox ash ./seed.sh
../busybox ls -la .
../busybox ls -la stage
../busybox ls -la stage/store
../busybox ls -la stage/recipes


