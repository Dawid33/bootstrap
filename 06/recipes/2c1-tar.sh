#!/store/2b2-busybox/bin/ash

#> FETCH c77a38fcf25b21fd8209d20d35638744344ded239cfc7df80138bf46d3c6b16d
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/tar-1.35.cpio.gz
 
set -uex

export PATH="/store/2c1-coreutils/bin"
export PATH="$PATH:/store/2b2-busybox/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2b10-bash/bin"
export PATH="$PATH:/store/2b5-m4/bin"
export PATH="$PATH:/store/2c4-autoconf/bin"
export PATH="$PATH:/store/2c4-automake/bin"
export PATH="$PATH:/store/2c0-libtool/bin"
export PATH="$PATH:/store/2b11-file/bin"
export PATH="$PATH:/store/2c3-perl/bin"
export PATH="$PATH:/store/2c1-patchelf/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-tar
rm -rf /store/2c1-tar
mkdir -p /tmp/2c1-tar; cd /tmp/2c1-tar
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking tar sources..."
gzip -cd /downloads/tar-1.35.cpio.gz | cpio -idmv
mv tar-1.35/* .
rm -rf tar-1.35

echo "### $0: building tar"
# sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' /store/2c1-tar/bin/autopoint
FORCE_UNSAFE_CONFIGURE=1 ash ./configure \
  --prefix=/store/2c1-tar
make -j $NPROC
echo "### $0: installing tar"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-tar )
