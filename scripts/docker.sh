#!/bin/bash
cd /home/dawids/Projects/bootstrap
podman build -t dawids/strap-ci-base:latest -f ci.dockerfile .
podman push dawids/strap-ci-base:latest docker://forgejo.dawidsobczak.com/dawids/strap-ci-base:latest
cd -
