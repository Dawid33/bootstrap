all: /store/2a0-static-gnumake

.PHONY: clean-0-tcc-seed clean-1-stage1 clean-1-stage1 

export NPROC=$(nproc --all)
	
stage/store/0-tcc-seed: ./helpers/seed.sh \
	recipes/0-tcc-seed/seed.host-executed.sh \
	recipes/1-stage1/seed.host-executed.sh
	rm -rf stage/protosrc
	rm -rf stage/store/0-tcc-seed
	rm -rf stage/tmp/1-stage1
	NPROC=$(nproc --all) ./helpers/seed.sh

stage/pkgs/1-stage1: recipes/1-stage1.c recipes/1-stage1/* \
	stage/store/0-tcc-seed downloads/musl-1.2.4.tar.gz \
	downloads/tinycc-mob-af1abf1.tar.gz downloads/busybox-1.36.1.tar.bz2
	mkdir -p stage/pkgs
	proot --rootfs=stage -0 --bind=/dev -w / /store/0-tcc-seed -I /protosrc/tinycc/include \
		-nostdinc -nostdlib -Werror -run /recipes/1-stage1.c
	touch stage/pkgs/1-stage1

stage/pkgs/%: recipes/%.sh
	cp $< stage/$<
	mkdir -p stage/pkgs
	(proot --rootfs=stage -0 --bind=/dev -w / /$<) && touch $@

stage/pkgs/2a0-static-gnumake: stage/pkgs/1-stage1
stage/pkgs/2a0-static-gnumake: downloads/make-4.4.1.tar.gz

ifeq ($(USE_CCACHE), 1)
stage/pkgs/_2a0-ccache: stage/pkgs/1-stage1
stage/pkgs/_2a0-ccache: stage/pkgs/2a0-static-gnumake
stage/pkgs/_2a0-ccache: downloads/ccache-3.7.12.tar.xz
endif

stage/pkgs/2/01-gnumake: stage/pkgs/1-stage1
stage/pkgs/2/01-gnumake: stage/pkgs/2/00-intermediate-gnumake
stage/pkgs/2/01-gnumake: downloads/make-4.4.1.tar.gz

ifeq ($(USE_CCACHE), 1)
stage/pkgs/2a1-static-binutils: stage/pkgs/_2a0-ccache
endif
stage/pkgs/2a1-static-binutils: stage/pkgs/1-stage1
stage/pkgs/2a1-static-binutils: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a1-static-binutils: downloads/binutils-2.39.tar.xz

stage/pkgs/2a2-static-gnugcc4-c: stage/pkgs/1-stage1
stage/pkgs/2a2-static-gnugcc4-c: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a2-static-gnugcc4-c: stage/pkgs/2a1-static-binutils
stage/pkgs/2a2-static-gnugcc4-c: downloads/gmp-4.3.2.tar.xz
stage/pkgs/2a2-static-gnugcc4-c: downloads/mpfr-2.4.2.tar.xz
stage/pkgs/2a2-static-gnugcc4-c: downloads/mpc-0.8.1.tar.gz
stage/pkgs/2a2-static-gnugcc4-c: downloads/gcc-4.7.4.tar.bz2

stage/pkgs/2a3-intermediate-musl: stage/pkgs/1-stage1
stage/pkgs/2a3-intermediate-musl: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a3-intermediate-musl: stage/pkgs/2a1-static-binutils
stage/pkgs/2a3-intermediate-musl: stage/pkgs/2a2-static-gnugcc4-c
stage/pkgs/2a3-intermediate-musl: downloads/musl-1.2.4.tar.gz

stage/pkgs/2a4-gnugcc4-cpp: stage/pkgs/1-stage1
stage/pkgs/2a4-gnugcc4-cpp: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a4-gnugcc4-cpp: stage/pkgs/2a1-static-binutils
stage/pkgs/2a4-gnugcc4-cpp: stage/pkgs/2a2-static-gnugcc4-c
stage/pkgs/2a4-gnugcc4-cpp: stage/pkgs/2a3-intermediate-musl
stage/pkgs/2a4-gnugcc4-cpp: downloads/gmp-4.3.2.tar.xz
stage/pkgs/2a4-gnugcc4-cpp: downloads/mpfr-2.4.2.tar.xz
stage/pkgs/2a4-gnugcc4-cpp: downloads/mpc-0.8.1.tar.gz
stage/pkgs/2a4-gnugcc4-cpp: downloads/gcc-4.7.4.tar.bz2

stage/pkgs/2a5-gnugcc10: stage/pkgs/1-stage1
stage/pkgs/2a5-gnugcc10: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a5-gnugcc10: stage/pkgs/2a1-static-binutils
stage/pkgs/2a5-gnugcc10: stage/pkgs/2a3-intermediate-musl
stage/pkgs/2a5-gnugcc10: stage/pkgs/2a4-gnugcc4-cpp
stage/pkgs/2a5-gnugcc10: downloads/gcc-10.5.0.tar.xz
stage/pkgs/2a5-gnugcc10: downloads/gmp-6.1.0.tar.xz
stage/pkgs/2a5-gnugcc10: downloads/mpc-1.0.3.tar.gz
stage/pkgs/2a5-gnugcc10: downloads/mpfr-3.1.4.tar.xz
stage/pkgs/2a5-gnugcc10: downloads/isl-0.18.tar.bz2

stage/pkgs/2a6-linux-headers: stage/pkgs/1-stage1
stage/pkgs/2a6-linux-headers: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a6-linux-headers: stage/pkgs/2a1-static-binutils
stage/pkgs/2a6-linux-headers: stage/pkgs/2a3-intermediate-musl
stage/pkgs/2a6-linux-headers: stage/pkgs/2a5-gnugcc10
stage/pkgs/2a6-linux-headers: downloads/linux-6.4.12.tar.xz

stage/pkgs/2a7-cmake: stage/pkgs/1-stage1
stage/pkgs/2a7-cmake: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a7-cmake: stage/pkgs/2a1-static-binutils
stage/pkgs/2a7-cmake: stage/pkgs/2a3-intermediate-musl
stage/pkgs/2a7-cmake: stage/pkgs/2a5-gnugcc10
stage/pkgs/2a7-cmake: stage/pkgs/2a6-linux-headers
stage/pkgs/2a7-cmake: downloads/cmake-3.27.4.tar.gz

stage/pkgs/2a8-python: stage/pkgs/1-stage1
stage/pkgs/2a8-python: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a8-python: stage/pkgs/2a1-static-binutils
stage/pkgs/2a8-python: stage/pkgs/2a3-intermediate-musl
stage/pkgs/2a8-python: stage/pkgs/2a5-gnugcc10
stage/pkgs/2a8-python: downloads/Python-3.12.0.tar.xz

stage/pkgs/2a9-intermediate-clang: stage/pkgs/1-stage1
stage/pkgs/2a9-intermediate-clang: stage/pkgs/2a0-static-gnumake
stage/pkgs/2a9-intermediate-clang: stage/pkgs/2a1-static-binutils
stage/pkgs/2a9-intermediate-clang: stage/pkgs/2a3-intermediate-musl
stage/pkgs/2a9-intermediate-clang: stage/pkgs/2a5-gnugcc10
stage/pkgs/2a9-intermediate-clang: stage/pkgs/2a7-cmake
stage/pkgs/2a9-intermediate-clang: stage/pkgs/2a8-python
stage/pkgs/2a9-intermediate-clang: downloads/llvm-project-17.0.1.src.tar.xz
	
stage/pkgs/2b0-musl: stage/pkgs/1-stage1
stage/pkgs/2b0-musl: stage/pkgs/2a0-static-gnumake
stage/pkgs/2b0-musl: stage/pkgs/2a1-static-binutils
stage/pkgs/2b0-musl: stage/pkgs/2a9-intermediate-clang
stage/pkgs/2b0-musl: downloads/musl-1.2.4.tar.gz

stage/pkgs/2b1-clang: stage/pkgs/1-stage1
stage/pkgs/2b1-clang: stage/pkgs/2a0-static-gnumake
stage/pkgs/2b1-clang: stage/pkgs/2a1-static-binutils
stage/pkgs/2b1-clang: stage/pkgs/2a7-cmake
stage/pkgs/2b1-clang: stage/pkgs/2a8-python
stage/pkgs/2b1-clang: downloads/llvm-project-17.0.1.src.tar.xz

stage/pkgs/2b2-busybox: stage/pkgs/1-stage1
stage/pkgs/2b2-busybox: stage/pkgs/2a0-static-gnumake
stage/pkgs/2b2-busybox: stage/pkgs/2b1-clang
stage/pkgs/2b2-busybox: downloads/busybox-1.36.1.tar.bz2

# /recipes/2b2-busybox.sh
# /recipes/2b3-gnumake.sh
# /recipes/2b4-gnugcc13.sh
# /recipes/2b5-m4.sh
# /recipes/2b6-grep.sh
# /recipes/2b7-gawk.sh
# /recipes/2b8-bison.sh
# /recipes/2c3-perl.sh
# /recipes/2c4-autoconf.sh
# /recipes/2c4-automake.sh
# /recipes/2c0-libtool.sh
# /recipes/2b11-file.sh
clean:
	rm -rf stage


	
