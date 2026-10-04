#!/bin/sh
# Stream the source tarball layers of the CI base image (see ci/base.dockerfile
# and ci/publish_ci_image.sh) from ghcr.io straight into 06/downloads and/or
# 07/downloads, without pulling the whole ~23GB image.
#
#   GHCR_USER=<user> GHCR_TOKEN=<token with read:packages> ./ci/fetch_ci_sources.sh 06 [07]
set -eu

cd "$(dirname -- "$0")/.."
: ${IMAGE_REPO:=dawid33/strap-ci-base}
: ${IMAGE_TAG:=latest}
[ $# -gt 0 ] || { echo "usage: $0 06|07 ..." >&2; exit 2; }

token=$(curl -fsSL -u "$GHCR_USER:$GHCR_TOKEN" \
	"https://ghcr.io/token?scope=repository:$IMAGE_REPO:pull" | jq -r .token)
manifest=$(curl -fsSL -H "Authorization: Bearer $token" \
	-H "Accept: application/vnd.docker.distribution.manifest.v2+json" \
	-H "Accept: application/vnd.oci.image.manifest.v1+json" \
	"https://ghcr.io/v2/$IMAGE_REPO/manifests/$IMAGE_TAG")

# base.dockerfile ends with ADD 06/downloads, ADD 07/downloads, so those are
# the last two layers.
for stage in "$@"; do
	case "$stage" in
		06) index=-2 ;;
		07) index=-1 ;;
		*) echo "unknown stage $stage" >&2; exit 2 ;;
	esac
	digest=$(echo "$manifest" | jq -r ".layers[$index].digest")
	type=$(echo "$manifest" | jq -r ".layers[$index].mediaType")
	case "$type" in
		*zstd*) decompress=--zstd ;;
		*) decompress=--gzip ;;
	esac
	echo "### $stage/downloads <- $IMAGE_REPO@$digest"
	curl -fsSL -H "Authorization: Bearer $token" \
		"https://ghcr.io/v2/$IMAGE_REPO/blobs/$digest" |
		tar -x $decompress --wildcards "$stage/downloads/*"
	[ -n "$(ls "$stage/downloads")" ] || { echo "no tarballs in $stage/downloads" >&2; exit 1; }
	ls "$stage/downloads" | wc -l
done
