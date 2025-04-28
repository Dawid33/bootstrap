#!/store/2b2-busybox/bin/ash

# FETCH 6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1
#  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/libsodium-1.0.18.tar.gz


set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b1-clang/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2c2-pkg-config/bin"
export PKG_CONFIG_PATH='/store/3a-openssl/lib64/pkgconfig'

mkdir -p /tmp/3a-libsodium; cd /tmp/3a-libsodium
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking libsodium sources..."
tar --strip-components=1 -xf /downloads/libsodium-1.0.18.tar.gz

echo "### $0: fixing up libsodium sources..."
sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
	configure build-aux/install-sh

echo "### $0: building libsodium..."
ash configure --prefix=/store/3a-libsodium \
	--disable-dependency-tracking
make -j $NPROC

echo "### $0: installing libsodium..."
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/3a /store/3a-libsodium )
