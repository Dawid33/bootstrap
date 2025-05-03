rm -rf fs
mkdir -p fs; cd fs;
tar --strip-components=1 -xf ../../06/stage/store/2c1-buildroot/rootfs.tar
chmod -R u=rwx,go=rx *
cd ..

MOUNT=$(command -v mount)
MKDIR=$(command -v mkdir)
CHROOT=$(command -v chroot)

exec env -i "NPROC=$NPROC" unshare -nrm bash -uexs <<EOF
	ls -la fs/bin

	export PATH="/bin"
	../busybox chroot fs /bin/ash
EOF
