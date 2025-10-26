#!/store/2b2-busybox/bin/ash

#> FETCH eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/zstd-1.5.7.tar.gz 
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a7-cmake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export SHELL=/store/2b2-busybox/bin/ash

rm -rf /tmp/2c1-zstd
rm -rf /store/2c1-zstd
mkdir -p /tmp/2c1-zstd; cd /tmp/2c1-zstd
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking zlib sources..."
tar --strip-components=1 -xf /downloads/zstd-1.5.7.tar.gz 

echo "### $0: building zlib..."
mkdir -p /store/2c1-zstd

export CC=gcc
export PREFIX=/store/2c1-zstd 
cmake -B build-cmake-debug -S build/cmake -DCMAKE_OSX_ARCHITECTURES="x86_64;x86_64h;arm64"
make -j $NPROC
make install





