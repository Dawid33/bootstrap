#!/bin/sh
podman build --format docker -t dawids/strap-ci-base:latest -f ./ci/ci.dockerfile .
