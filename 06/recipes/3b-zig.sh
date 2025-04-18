#!/store/2b2-busybox/bin/ash

#> FETCH 
#>  FROM https://github.com/ziglang/zig-bootstrap/archive/refs/tags/0.14.0.tar.gz
#>    AS zig-bootstrap-0.14.0.tar.gz

mkdir -p /tmp/3a-zig; cd /tmp/3a-zig

echo "### $0: unpacking zig-boostrap sources..."
tar --strip-components=1 -xf /downloads/zig-bootstrap-0.14.0.tar.gz

export PATH='/store/2b2-busybox/bin'
export PATH="$PATH:/store/2b1-clang/bin"
export PATH="$PATH:/store/2b3-gnumake/bin"
