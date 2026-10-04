#!/bin/sh

# musl-root for rustc's x86_64-unknown-linux-musl std (see host-rust-1.101.sh).

#> FETCH a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4
#>  FROM https://musl.libc.org/releases/musl-1.2.5.tar.gz

set -uex

rm -rf /tmp/host-musl
mkdir -p /tmp/host-musl; cd /tmp/host-musl
tar --no-same-owner --strip-components=1 -xf /tmp/downloads/musl-1.2.5.tar.gz

./configure --prefix=/usr/local/musl --disable-shared
make -j$NPROC
make install

# musl only ships musl-gcc; rustbuild also needs a C++ compiler for the
# in-tree libunwind it builds for the musl target.
cat << "EOF" > /usr/local/musl/bin/musl-g++
#!/bin/sh
exec "${REALGXX:-g++}" -nostdinc -isystem /usr/local/musl/include -isystem "$(g++ -print-file-name=include)" "$@" -specs /usr/local/musl/lib/musl-gcc.specs
EOF
chmod +x /usr/local/musl/bin/musl-g++
