#!/store/2b2-busybox/bin/ash

#> FETCH 9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23
#>  FROM http://static.dawidsobczak.com/redox-toolchain-bootstrap/zlib-1.3.1.tar.gz
 
export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b4-gnugcc13/bin"
export PATH="$PATH:/store/2a7-cmake/bin"
export PATH="$PATH:/store/2b9-binutils/bin"
export PATH="$PATH:/store/2b3-gnumake/wrappers"
export SHELL=/store/2b2-busybox/bin/ash
# 
mkdir -p /tmp/2c1-zlib; cd /tmp/2c1-zlib
if [ -e /ccache/setup ]; then . /ccache/setup; fi

echo "### $0: unpacking zlib sources..."
tar --strip-components=1 -xf /downloads/zlib-1.3.1.tar.gz

echo "### $0: building zlib..."
mkdir -p /store/2c1-zlib
cmake -DCMAKE_INSTALL_PREFIX=/store/2c1-zlib -B build;
cd build; make install





