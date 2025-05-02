#!/bin/bash

for arg in "$@"; do
  filename=$(basename "$arg")
  wget --quiet "$arg"
  echo "#> FETCH $(sha256sum $filename | awk '{print $1}')"
  echo "#>  FROM $arg"
  cp $filename stage/downloads
  cp $filename downloads
done
