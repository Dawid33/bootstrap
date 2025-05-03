#!/store/2b2-busybox/bin/ash

#> FETCH c918503d593d70daf4844d175a13d816afacb667c06fba1ec9dcd5002c1518b7  
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/gettext-0.24.tar.gz
 
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

rm -rf /tmp/2c1-gettext
rm -rf /store/2c1-gettext
mkdir -p /tmp/2c1-gettext; cd /tmp/2c1-gettext
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/gettext-0.23.1.tar.gz

echo "### $0: building GNU GAWK"
export LD_LIBRARY_PATH="/store/2b0-musl/lib"
export LIBRARY_PATH="/store/2b0-musl/lib"
mkdir -p /bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
ln -fs /store/2b10-bash/bin/bash /bin/bash
ash ./configure \
  --prefix=/store/2c1-gettext
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip
rm -rf /bin

sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' /store/2c1-gettext/bin/autopoint

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2c1-gettext )
