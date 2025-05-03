#!/store/2b2-busybox/bin/ash

#> FETCH 
#>  FROM 

set -uex

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b3-gnumake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a8-python/bin"

rm -rf /tmp/2c1-gettext-tiny
rm -rf /store/2c1-gettext-tiny 
mkdir -p /tmp/2c1-gettext-tiny; cd /tmp/2c1-gettext-tiny
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases; ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2c1-gettext-tiny/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/gettext-tiny-0.3.2.tar.gz

echo "### $0: building GNU GAWK"
export CC=gcc
mkdir -p /bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
make LIBINTL=MUSL DESTDIR=/store/2c1-gettext-tiny  prefix=/ install
rm -rf /bin

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2c1 /store/2c1-gettext-tiny )
