#!/store/2b2-busybox/bin/ash

#> FETCH 2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9
#>  FROM https://mirror.ibcp.fr/pub/gnu/grep/grep-3.12.tar.xz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2b6-grep
mkdir -p /tmp/2b6-grep; cd /tmp/2b6-grep
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2b6-grep/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/grep-3.12.tar.xz

echo "### $0: building GNU GAWK"
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CFLAGS=-O2 CXX_FLAGS=-O2 \
	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
	--prefix=/store/2b6-grep \
	--disable-dependency-tracking
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	./build-aux/install-sh po/Makefile
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b6-grep )
