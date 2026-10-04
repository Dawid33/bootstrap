#!/bin/sh
# Make sure every 06/07 source tarball is downloaded, then build the CI base
# image (which bakes them in) and push it to ghcr.io.
#
#   GHCR_TOKEN=<PAT with write:packages> ./ci/publish_ci_image.sh
#
# Without GHCR_TOKEN an existing `podman login ghcr.io` is used.
set -eu

cd "$(dirname -- "$0")/.."
ROOT=$(pwd)
: ${IMAGE:=ghcr.io/dawid33/strap-ci-base:latest}
: ${GHCR_USER:=dawid33}

# 06: scans recipes for #> FETCH blocks; DESTDIR=downloads skips copying into stage/
(cd 06 && DESTDIR=downloads bash ./helpers/download.sh)

# 07: download.sh calls ../busybox, which only exists inside the 06 rootfs
if [ ! -e busybox ]; then
	ln -s ci/bin/busybox busybox
	trap 'rm -f "$ROOT/busybox"' EXIT
fi
(cd 07 && sh ./download.sh)

podman build --format docker \
	--label org.opencontainers.image.source=https://github.com/Dawid33/bootstrap \
	-t "$IMAGE" -f ./ci/base.dockerfile .

if [ -n "${GHCR_TOKEN:-}" ]; then
	echo "$GHCR_TOKEN" | podman login ghcr.io --username "$GHCR_USER" --password-stdin
fi
podman push "$IMAGE"
