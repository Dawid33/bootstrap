
env -i "NPROC=$NPROC" unshare -nrm ../busybox chroot "fs" /usr/bin/env -i   \
    HOME=/root                  \
    PS1='(chroot) \u:\w\$ ' \
    TERM="xterm" \
    PATH=/usr/bin:/usr/sbin     \
    MAKEFLAGS="-j$(nproc)"      \
    TESTSUITEFLAGS="-j$(nproc)" \
    /bin/bash --login
