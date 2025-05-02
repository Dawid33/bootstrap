#!/store/2b2-busybox/bin/ash

#> FETCH 
#>  FROM 

set -uex

export PATH="/store/2c1-coreutils/bin"
export PATH="$PATH:/store/2c1-gettext/bin"
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

/store/2c1-gettext/bin/autopoint
exit
rm -rf /tmp/2b9-flex
rm -rf /store/2b9-flex
mkdir -p /tmp/2b9-flex; cd /tmp/2b9-flex
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: aliasing ash to sh..."
mkdir -p aliases;
ln -s /store/2b2-busybox/bin/ash aliases/sh
export PATH="/tmp/2b9-flex/aliases:$PATH"

echo "### $0: unpacking GNU GAWK sources..."
tar --strip-components=1 -xf /downloads/flex-2.5.39.tar.gz

echo "### $0: building GNU GAWK"
ash ./autogen.sh
# autoreconf --install --force
# ash ./configure \
# 	CONFIG_SHELL='/store/2b2-busybox/bin/ash' \
# 	SHELL='/store/2b2-busybox/bin/ash' \
# 	CFLAGS=-O2 CXX_FLAGS=-O2 \
# 	CFLAGS_FOR_TARGET=-O2 CXXFLAGS_FOR_TARGET=-O2 \
# 	--prefix=/store/2b9-flex \
# 	--disable-dependency-tracking
# sed -i 's|/bin/sh|/store/2b2-busybox/bin/ash|' \
# 	./build-aux/install-sh ./build-aux/move-if-change po/Makefile runtime-po/Makefile \
# 	gnulib-po/Makefile

mkdir -p /bin
mkdir -p /usr/bin
ln -fs /store/2b2-busybox/bin/ash /bin/sh
ln -fs /store/2b10-bash/bin/bash /bin/bash
make -j $NPROC
echo "### $0: installing GNU GAWK"
make -j $NPROC install-strip

echo "### $0: checking for build path leaks..."
( ! grep -rF /tmp/2a5 /store/2b9-flex )
