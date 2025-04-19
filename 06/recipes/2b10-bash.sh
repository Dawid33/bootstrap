#!/store/2b2-busybox/bin/ash

# FETCH 9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff
#  FROM https://ftp.gnu.org/gnu/bash/bash-5.2.37.tar.gz

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b7-gawk/bin"
export PATH="$PATH:/store/2b8-bison/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b9-binutils/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2b10-bash
mkdir -p /tmp/2b10-bash; cd /tmp/2b10-bash
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
ln -s /store/2b6-grep/bin/grep aliases/grep
export PATH="/tmp/2b10-bash/aliases:$PATH"

echo "### $0: unpacking GNU GLIBC 13 sources..."
tar --strip-components=1 -xf /downloads/bash-5.2.37.tar.gz

echo "### $0: building GNU GLIBC 13"

sed -i 's|/bin/pwd|/store/2b2-busybox/bin/pwd|' configure

mkdir build && cd build;
ash ../configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	--with-gnu-ld \
	--with-bash-malloc \
	--prefix=/store/2b10-bash

mkdir -p /bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
make -j $NPROC
echo "### $0: installing GNU GLIBC 13"
make -j $NPROC install
rm -rf /bin

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b10-bash )
