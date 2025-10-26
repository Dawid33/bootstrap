set -x
../busybox ash ./download.sh

../busybox rm -rf fs
../busybox cp -r ../06/stage/fs fs
../busybox rm fs/lib64
../busybox ln -s /usr/lib fs/lib64
../busybox rm fs/bin/sh
../busybox ln -s /usr/bin/bash fs/bin/sh
../busybox ln -s /usr/bin/bash fs/bin/bash
../busybox mkdir -p fs/root
../busybox mkdir -p fs/etc
../busybox mkdir -p fs/usr/local
../busybox mkdir -p fs/dev

../busybox mkdir -p fs/tmp
../busybox cp -r downloads fs/tmp/downloads
../busybox cp -r recipes fs/tmp/recipes

../busybox cat > fs/etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/usr/bin/false
daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
EOF

../busybox cat > fs/etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuidd:x:80:
wheel:x:97:
users:x:999:
nogroup:x:65534:
EOF

