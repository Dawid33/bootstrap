#!/bin/sh

rm -rf /tmp
rm -rf /usr/local/share/*
rm -rf /root/.cargo

cat << EOF > /root/.bashrc
export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig"
export LD_LIBRARY_PATH="/usr/lib:/usr/local/lib:/usr/local/lib64"
export PATH="/bin:/usr/bin:/usr/local/bin"
EOF
