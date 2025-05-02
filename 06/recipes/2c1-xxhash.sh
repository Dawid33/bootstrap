#!/store/2b2-busybox/bin/ash

#> FETCH aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80
#>  FROM https://static.dawidsobczak.com/redox-toolchain-bootstrap/xxhash-0.8.3.tar.gz 
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a7-cmake/bin"
export PATH="$PATH:/store/2a1-static-binutils/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export SHELL=/store/2b2-busybox/bin/ash

rm -rf /tmp/2c1-xxhash
rm -rf /store/2c1-xxhash
mkdir -p /tmp/2c1-xxhash; cd /tmp/2c1-xxhash
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking zlib sources..."
tar --strip-components=1 -xf /downloads/xxhash-0.8.3.tar.gz 

echo "### $0: building zlib..."
mkdir -p /store/2c1-xxhash

export CC=gcc
export PREFIX=/store/2c1-xxhash 
make -j $NPROC all
make install





