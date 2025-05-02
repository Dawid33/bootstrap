#!/store/2b2-busybox/bin/ash

#> FETCH 7dbda2c6b863cd309ffda85c19f0e8754e5cec049b6f860783f8a0ad20c1a503
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/rsync-3.4.1.tar.gz

set -uex

export PATH="/store/2c1-coreutils/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2b10-bash/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-rsync
rm -rf /store/2c1-rsync
mkdir -p /tmp/2c1-rsync; cd /tmp/2c1-rsync
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/rsync-3.4.1.tar.gz

# export LIBRARY_PATH="/store/2c1-zstd/lib"
# export CPATH="/store/2c1-zstd/include"

echo "### $0: building GNU GAWK"
export CC=gcc
ash configure \
	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
	SHELL='/store/2b2-busybox/bin/ash' \
	CPPFLAGS="-I /store/2c1-zstd/include" \
	LDFLAGS="-L /store/2c1-zstd/lib" \
	--disable-md2man \
	--disable-openssl \
	--disable-lz4 \
	--disable-xxhash \
	--prefix=/store/2c1-rsync

make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-rsync )
