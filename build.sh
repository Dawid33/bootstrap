#!/bin/sh

./ci/rooted ash ./ci/initboot.sh
proot --rootfs=06/stage -0 --bind=/dev -w / /store/0-tcc-seed -I /protosrc/tinycc/include -nostdinc -nostdlib -Werror -run \
		-DCHAINLOAD='"/recipes/all-past-stage1.sh"' \
		/recipes/1-stage1.c
