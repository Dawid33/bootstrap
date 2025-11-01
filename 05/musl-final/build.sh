set -x
ln -sf ../arch/x86_64/bits include/bits
ash include/bits/alltypes.h.sh > include/bits/alltypes.h
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/conf/confstr.o src/conf/confstr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/conf/fpathconf.o src/conf/fpathconf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/conf/pathconf.o src/conf/pathconf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/conf/sysconf.o src/conf/sysconf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/__ctype_get_mb_cur_max.o src/ctype/__ctype_get_mb_cur_max.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isalnum.o src/ctype/isalnum.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isalpha.o src/ctype/isalpha.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isascii.o src/ctype/isascii.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isblank.o src/ctype/isblank.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iscntrl.o src/ctype/iscntrl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isdigit.o src/ctype/isdigit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isgraph.o src/ctype/isgraph.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/islower.o src/ctype/islower.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isprint.o src/ctype/isprint.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/ispunct.o src/ctype/ispunct.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isspace.o src/ctype/isspace.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isupper.o src/ctype/isupper.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswalnum.o src/ctype/iswalnum.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswalpha.o src/ctype/iswalpha.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswblank.o src/ctype/iswblank.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswcntrl.o src/ctype/iswcntrl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswctype.o src/ctype/iswctype.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswdigit.o src/ctype/iswdigit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswgraph.o src/ctype/iswgraph.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswlower.o src/ctype/iswlower.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswprint.o src/ctype/iswprint.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswpunct.o src/ctype/iswpunct.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswspace.o src/ctype/iswspace.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswupper.o src/ctype/iswupper.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/iswxdigit.o src/ctype/iswxdigit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/isxdigit.o src/ctype/isxdigit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/toascii.o src/ctype/toascii.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/tolower.o src/ctype/tolower.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/toupper.o src/ctype/toupper.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/towctrans.o src/ctype/towctrans.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/wcswidth.o src/ctype/wcswidth.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/wctrans.o src/ctype/wctrans.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ctype/wcwidth.o src/ctype/wcwidth.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/__getdents.o src/dirent/__getdents.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/alphasort.o src/dirent/alphasort.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/closedir.o src/dirent/closedir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/dirfd.o src/dirent/dirfd.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/fdopendir.o src/dirent/fdopendir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/opendir.o src/dirent/opendir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/readdir.o src/dirent/readdir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/readdir_r.o src/dirent/readdir_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/rewinddir.o src/dirent/rewinddir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/scandir.o src/dirent/scandir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/seekdir.o src/dirent/seekdir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/dirent/telldir.o src/dirent/telldir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/__environ.o src/env/__environ.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/__libc_start_main.o src/env/__libc_start_main.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/clearenv.o src/env/clearenv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/getenv.o src/env/getenv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/putenv.o src/env/putenv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/setenv.o src/env/setenv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/env/unsetenv.o src/env/unsetenv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/errno/__errno_location.o src/errno/__errno_location.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/errno/strerror.o src/errno/strerror.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/exit/_Exit.o src/exit/_Exit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/exit/abort.o src/exit/abort.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/exit/assert.o src/exit/assert.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/exit/atexit.o src/exit/atexit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/exit/exit.o src/exit/exit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/fcntl/creat.o src/fcntl/creat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/fcntl/fcntl.o src/fcntl/fcntl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/fcntl/open.o src/fcntl/open.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/fcntl/openat.o src/fcntl/openat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/internal/libc.o src/internal/libc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/internal/syscall.o src/internal/syscall.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/ftok.o src/ipc/ftok.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/semctl.o src/ipc/semctl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/semget.o src/ipc/semget.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/semop.o src/ipc/semop.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/shmat.o src/ipc/shmat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/shmctl.o src/ipc/shmctl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/shmdt.o src/ipc/shmdt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/ipc/shmget.o src/ipc/shmget.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/brk.o src/linux/brk.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/chroot.o src/linux/chroot.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/daemon.o src/linux/daemon.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/epoll_create.o src/linux/epoll_create.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/epoll_create1.o src/linux/epoll_create1.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/epoll_ctl.o src/linux/epoll_ctl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/epoll_pwait.o src/linux/epoll_pwait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/epoll_wait.o src/linux/epoll_wait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/getdtablesize.o src/linux/getdtablesize.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/gethostid.o src/linux/gethostid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/getopt_long.o src/linux/getopt_long.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/getpagesize.o src/linux/getpagesize.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/getpass.o src/linux/getpass.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/initgroups.o src/linux/initgroups.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/klogctl.o src/linux/klogctl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/mntent.o src/linux/mntent.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/mount.o src/linux/mount.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/prctl.o src/linux/prctl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/reboot.o src/linux/reboot.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/sbrk.o src/linux/sbrk.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/sendfile.o src/linux/sendfile.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/setgroups.o src/linux/setgroups.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/sethostname.o src/linux/sethostname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/settimeofday.o src/linux/settimeofday.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/signalfd.o src/linux/signalfd.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/stime.o src/linux/stime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/swapoff.o src/linux/swapoff.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/swapon.o src/linux/swapon.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/sysinfo.o src/linux/sysinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/umount.o src/linux/umount.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/umount2.o src/linux/umount2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/utimes.o src/linux/utimes.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/wait3.o src/linux/wait3.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/linux/wait4.o src/linux/wait4.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/catclose.o src/locale/catclose.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/catgets.o src/locale/catgets.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/catopen.o src/locale/catopen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/duplocale.o src/locale/duplocale.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/freelocale.o src/locale/freelocale.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/iconv.o src/locale/iconv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/intl.o src/locale/intl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isalnum_l.o src/locale/isalnum_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isalpha_l.o src/locale/isalpha_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isblank_l.o src/locale/isblank_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/iscntrl_l.o src/locale/iscntrl_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isdigit_l.o src/locale/isdigit_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isgraph_l.o src/locale/isgraph_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/islower_l.o src/locale/islower_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isprint_l.o src/locale/isprint_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/ispunct_l.o src/locale/ispunct_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isspace_l.o src/locale/isspace_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isupper_l.o src/locale/isupper_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/isxdigit_l.o src/locale/isxdigit_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/langinfo.o src/locale/langinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/localeconv.o src/locale/localeconv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/newlocale.o src/locale/newlocale.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/nl_langinfo.o src/locale/nl_langinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/setlocale.o src/locale/setlocale.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/strcoll.o src/locale/strcoll.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/strxfrm.o src/locale/strxfrm.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/tolower_l.o src/locale/tolower_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/toupper_l.o src/locale/toupper_l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/wcscoll.o src/locale/wcscoll.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/locale/wcsxfrm.o src/locale/wcsxfrm.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/malloc/__brk.o src/malloc/__brk.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/malloc/__simple_malloc.o src/malloc/__simple_malloc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/malloc/calloc.o src/malloc/calloc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/malloc/malloc.o src/malloc/malloc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/malloc/memalign.o src/malloc/memalign.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/malloc/posix_memalign.o src/malloc/posix_memalign.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/__fpclassify.o src/math/__fpclassify.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/__fpclassifyf.o src/math/__fpclassifyf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/__fpclassifyl.o src/math/__fpclassifyl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_acos.o src/math/e_acos.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_acosf.o src/math/e_acosf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_acosh.o src/math/e_acosh.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_acoshf.o src/math/e_acoshf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_asin.o src/math/e_asin.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_asinf.o src/math/e_asinf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_atan2.o src/math/e_atan2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_atan2f.o src/math/e_atan2f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_atanh.o src/math/e_atanh.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_atanhf.o src/math/e_atanhf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_cosh.o src/math/e_cosh.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_coshf.o src/math/e_coshf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_exp.o src/math/e_exp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_expf.o src/math/e_expf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_fmod.o src/math/e_fmod.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_fmodf.o src/math/e_fmodf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_hypot.o src/math/e_hypot.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_hypotf.o src/math/e_hypotf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_log.o src/math/e_log.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_log10.o src/math/e_log10.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_log10f.o src/math/e_log10f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_logf.o src/math/e_logf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_pow.o src/math/e_pow.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_powf.o src/math/e_powf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_rem_pio2.o src/math/e_rem_pio2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_rem_pio2f.o src/math/e_rem_pio2f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_remainder.o src/math/e_remainder.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_remainderf.o src/math/e_remainderf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_scalb.o src/math/e_scalb.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_scalbf.o src/math/e_scalbf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_sinh.o src/math/e_sinh.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_sinhf.o src/math/e_sinhf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_sqrt.o src/math/e_sqrt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/e_sqrtf.o src/math/e_sqrtf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_cos.o src/math/k_cos.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_cosf.o src/math/k_cosf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_rem_pio2.o src/math/k_rem_pio2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_rem_pio2f.o src/math/k_rem_pio2f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_sin.o src/math/k_sin.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_sinf.o src/math/k_sinf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_tan.o src/math/k_tan.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/k_tanf.o src/math/k_tanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log.o src/math/log.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log10.o src/math/log10.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log10f.o src/math/log10f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log10l.o src/math/log10l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log1p.o src/math/log1p.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log1pf.o src/math/log1pf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log1pl.o src/math/log1pl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log2.o src/math/log2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log2f.o src/math/log2f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/log2l.o src/math/log2l.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/logb.o src/math/logb.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/logbf.o src/math/logbf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/logbl.o src/math/logbl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/logf.o src/math/logf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/logl.o src/math/logl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_asinh.o src/math/s_asinh.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_asinhf.o src/math/s_asinhf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_atan.o src/math/s_atan.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_atanf.o src/math/s_atanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_cbrt.o src/math/s_cbrt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_cbrtf.o src/math/s_cbrtf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_ceil.o src/math/s_ceil.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_ceilf.o src/math/s_ceilf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_copysign.o src/math/s_copysign.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_copysignf.o src/math/s_copysignf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_cos.o src/math/s_cos.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_cosf.o src/math/s_cosf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_erf.o src/math/s_erf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_erff.o src/math/s_erff.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_expm1.o src/math/s_expm1.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_expm1f.o src/math/s_expm1f.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_fabs.o src/math/s_fabs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_fabsf.o src/math/s_fabsf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_floor.o src/math/s_floor.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_floorf.o src/math/s_floorf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_ilogb.o src/math/s_ilogb.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_ilogbf.o src/math/s_ilogbf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_ldexp.o src/math/s_ldexp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_ldexpf.o src/math/s_ldexpf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_llrint.o src/math/s_llrint.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_log1p.o src/math/s_log1p.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_log1pf.o src/math/s_log1pf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_logb.o src/math/s_logb.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_logbf.o src/math/s_logbf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_lrint.o src/math/s_lrint.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_lrintf.o src/math/s_lrintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_modf.o src/math/s_modf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_modff.o src/math/s_modff.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_nextafter.o src/math/s_nextafter.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_nextafterf.o src/math/s_nextafterf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_remquo.o src/math/s_remquo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_remquof.o src/math/s_remquof.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_rint.o src/math/s_rint.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_rintf.o src/math/s_rintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_round.o src/math/s_round.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_roundf.o src/math/s_roundf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_scalbln.o src/math/s_scalbln.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_scalblnf.o src/math/s_scalblnf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_sin.o src/math/s_sin.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_sinf.o src/math/s_sinf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_tan.o src/math/s_tan.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_tanf.o src/math/s_tanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_tanh.o src/math/s_tanh.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_tanhf.o src/math/s_tanhf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_trunc.o src/math/s_trunc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/math/s_truncf.o src/math/s_truncf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/basename.o src/misc/basename.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/bswap_32.o src/misc/bswap_32.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/bswap_64.o src/misc/bswap_64.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/crypt.o src/misc/crypt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/cuserid.o src/misc/cuserid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/dirname.o src/misc/dirname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/ffs.o src/misc/ffs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/ftw.o src/misc/ftw.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getdomainname.o src/misc/getdomainname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getgrouplist.o src/misc/getgrouplist.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getopt.o src/misc/getopt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getpriority.o src/misc/getpriority.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getrlimit.o src/misc/getrlimit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getrusage.o src/misc/getrusage.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/getsubopt.o src/misc/getsubopt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/ioctl.o src/misc/ioctl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/lockf.o src/misc/lockf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/nftw.o src/misc/nftw.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/openpty.o src/misc/openpty.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/pty.o src/misc/pty.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/realpath.o src/misc/realpath.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/sched_yield.o src/misc/sched_yield.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/setpriority.o src/misc/setpriority.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/setrlimit.o src/misc/setrlimit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/syslog.o src/misc/syslog.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/misc/uname.o src/misc/uname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/madvise.o src/mman/madvise.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/mlock.o src/mman/mlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/mlockall.o src/mman/mlockall.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/mmap.o src/mman/mmap.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/mprotect.o src/mman/mprotect.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/mremap.o src/mman/mremap.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/msync.o src/mman/msync.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/munlock.o src/mman/munlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/munlockall.o src/mman/munlockall.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/munmap.o src/mman/munmap.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/mman/posix_madvise.o src/mman/posix_madvise.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/btowc.o src/multibyte/btowc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/decode.o src/multibyte/decode.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/internal.o src/multibyte/internal.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mblen.o src/multibyte/mblen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbrlen.o src/multibyte/mbrlen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbrtowc.o src/multibyte/mbrtowc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbsinit.o src/multibyte/mbsinit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbsnrtowcs.o src/multibyte/mbsnrtowcs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbsrtowcs.o src/multibyte/mbsrtowcs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbstowcs.o src/multibyte/mbstowcs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/mbtowc.o src/multibyte/mbtowc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/wcrtomb.o src/multibyte/wcrtomb.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/wcsnrtombs.o src/multibyte/wcsnrtombs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/wcsrtombs.o src/multibyte/wcsrtombs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/wcstombs.o src/multibyte/wcstombs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/wctob.o src/multibyte/wctob.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/multibyte/wctomb.o src/multibyte/wctomb.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/__dns.o src/network/__dns.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/__ipparse.o src/network/__ipparse.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/accept.o src/network/accept.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/bind.o src/network/bind.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/connect.o src/network/connect.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/dn_expand.o src/network/dn_expand.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/ent.o src/network/ent.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/freeaddrinfo.o src/network/freeaddrinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gai_strerror.o src/network/gai_strerror.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getaddrinfo.o src/network/getaddrinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gethostbyaddr.o src/network/gethostbyaddr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gethostbyaddr_r.o src/network/gethostbyaddr_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gethostbyname.o src/network/gethostbyname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gethostbyname2.o src/network/gethostbyname2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gethostbyname2_r.o src/network/gethostbyname2_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/gethostbyname_r.o src/network/gethostbyname_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getnameinfo.o src/network/getnameinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getpeername.o src/network/getpeername.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getservbyname.o src/network/getservbyname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getservbyname_r.o src/network/getservbyname_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getservbyport.o src/network/getservbyport.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getservbyport_r.o src/network/getservbyport_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getsockname.o src/network/getsockname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/getsockopt.o src/network/getsockopt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/h_errno.o src/network/h_errno.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/hstrerror.o src/network/hstrerror.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/htonl.o src/network/htonl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/htons.o src/network/htons.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/in6addr_any.o src/network/in6addr_any.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/in6addr_loopback.o src/network/in6addr_loopback.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/inet_addr.o src/network/inet_addr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/inet_aton.o src/network/inet_aton.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/inet_ntoa.o src/network/inet_ntoa.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/inet_ntop.o src/network/inet_ntop.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/inet_pton.o src/network/inet_pton.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/listen.o src/network/listen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/ntohl.o src/network/ntohl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/ntohs.o src/network/ntohs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/proto.o src/network/proto.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/recv.o src/network/recv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/recvfrom.o src/network/recvfrom.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/recvmsg.o src/network/recvmsg.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/res_init.o src/network/res_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/res_query.o src/network/res_query.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/send.o src/network/send.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/sendmsg.o src/network/sendmsg.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/sendto.o src/network/sendto.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/serv.o src/network/serv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/setsockopt.o src/network/setsockopt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/shutdown.o src/network/shutdown.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/sockatmark.o src/network/sockatmark.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/socket.o src/network/socket.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/network/socketpair.o src/network/socketpair.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getgr_r.o src/passwd/getgr_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getgrent.o src/passwd/getgrent.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getgrent_a.o src/passwd/getgrent_a.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getpw_r.o src/passwd/getpw_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getpwent.o src/passwd/getpwent.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getpwent_a.o src/passwd/getpwent_a.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getspent.o src/passwd/getspent.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getspnam.o src/passwd/getspnam.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/getspnam_r.o src/passwd/getspnam_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/passwd/lckpwdf.o src/passwd/lckpwdf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/__rand48_step.o src/prng/__rand48_step.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/__seed48.o src/prng/__seed48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/drand48.o src/prng/drand48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/lcong48.o src/prng/lcong48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/lrand48.o src/prng/lrand48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/mrand48.o src/prng/mrand48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/rand.o src/prng/rand.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/rand_r.o src/prng/rand_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/random.o src/prng/random.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/seed48.o src/prng/seed48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/srand48.o src/prng/srand48.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/prng/srandom.o src/prng/srandom.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/execl.o src/process/execl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/execle.o src/process/execle.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/execlp.o src/process/execlp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/execv.o src/process/execv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/execve.o src/process/execve.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/execvp.o src/process/execvp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/fork.o src/process/fork.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/system.o src/process/system.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/vfork.o src/process/vfork.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/wait.o src/process/wait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/waitid.o src/process/waitid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/process/waitpid.o src/process/waitpid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/regex/fnmatch.o src/regex/fnmatch.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/regex/glob.o src/regex/glob.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/regex/regcomp.o src/regex/regcomp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/regex/regerror.o src/regex/regerror.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/regex/regexec.o src/regex/regexec.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/regex/tre-mem.o src/regex/tre-mem.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/select/poll.o src/select/poll.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/select/pselect.o src/select/pselect.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/select/select.o src/select/select.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/setjmp/longjmp.o src/setjmp/x86_64/longjmp.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/setjmp/setjmp.o src/setjmp/x86_64/setjmp.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/getitimer.o src/signal/getitimer.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/kill.o src/signal/kill.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/killpg.o src/signal/killpg.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/raise.o src/signal/raise.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/restore.o src/signal/x86_64/restore.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/setitimer.o src/signal/setitimer.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigaction.o src/signal/sigaction.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigaddset.o src/signal/sigaddset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigaltstack.o src/signal/sigaltstack.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigdelset.o src/signal/sigdelset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigemptyset.o src/signal/sigemptyset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigfillset.o src/signal/sigfillset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sighold.o src/signal/sighold.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigignore.o src/signal/sigignore.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/siginterrupt.o src/signal/siginterrupt.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigismember.o src/signal/sigismember.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/siglongjmp.o src/signal/siglongjmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/signal.o src/signal/signal.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigpause.o src/signal/sigpause.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigpending.o src/signal/sigpending.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigprocmask.o src/signal/sigprocmask.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigqueue.o src/signal/sigqueue.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigrelse.o src/signal/sigrelse.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigrtmax.o src/signal/sigrtmax.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigrtmin.o src/signal/sigrtmin.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigset.o src/signal/sigset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigsetjmp.o src/signal/x86_64/sigsetjmp.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigsuspend.o src/signal/sigsuspend.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigtimedwait.o src/signal/sigtimedwait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigwait.o src/signal/sigwait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/signal/sigwaitinfo.o src/signal/sigwaitinfo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/chmod.o src/stat/chmod.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/fchmod.o src/stat/fchmod.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/fchmodat.o src/stat/fchmodat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/fstat.o src/stat/fstat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/fstatat.o src/stat/fstatat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/fstatvfs.o src/stat/fstatvfs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/lstat.o src/stat/lstat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/mkdir.o src/stat/mkdir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/mkdirat.o src/stat/mkdirat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/mkfifo.o src/stat/mkfifo.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/mkfifoat.o src/stat/mkfifoat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/mknod.o src/stat/mknod.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/mknodat.o src/stat/mknodat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/stat.o src/stat/stat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/statvfs.o src/stat/statvfs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stat/umask.o src/stat/umask.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__fclose_ca.o src/stdio/__fclose_ca.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__fdopen.o src/stdio/__fdopen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__fopen_rb_ca.o src/stdio/__fopen_rb_ca.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__fpending.o src/stdio/__fpending.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__ofl.o src/stdio/__ofl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__overflow.o src/stdio/__overflow.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__scanf.o src/stdio/__scanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__stdio_close.o src/stdio/__stdio_close.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__stdio_read.o src/stdio/__stdio_read.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__stdio_seek.o src/stdio/__stdio_seek.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__stdio_write.o src/stdio/__stdio_write.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__uflow.o src/stdio/__uflow.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/__underflow.o src/stdio/__underflow.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/asprintf.o src/stdio/asprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/clearerr.o src/stdio/clearerr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/dprintf.o src/stdio/dprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fclose.o src/stdio/fclose.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/feof.o src/stdio/feof.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/ferror.o src/stdio/ferror.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fflush.o src/stdio/fflush.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fgetc.o src/stdio/fgetc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fgetpos.o src/stdio/fgetpos.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fgets.o src/stdio/fgets.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fgetwc.o src/stdio/fgetwc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fgetws.o src/stdio/fgetws.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fileno.o src/stdio/fileno.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fmemopen.o src/stdio/fmemopen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fopen.o src/stdio/fopen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fprintf.o src/stdio/fprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fputc.o src/stdio/fputc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fputs.o src/stdio/fputs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fputwc.o src/stdio/fputwc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fputws.o src/stdio/fputws.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fread.o src/stdio/fread.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/freopen.o src/stdio/freopen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fscanf.o src/stdio/fscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fseek.o src/stdio/fseek.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fsetpos.o src/stdio/fsetpos.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/ftell.o src/stdio/ftell.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fwide.o src/stdio/fwide.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fwrite.o src/stdio/fwrite.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/fwscanf.o src/stdio/fwscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getc.o src/stdio/getc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getc_unlocked.o src/stdio/getc_unlocked.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getchar.o src/stdio/getchar.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getchar_unlocked.o src/stdio/getchar_unlocked.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getdelim.o src/stdio/getdelim.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getline.o src/stdio/getline.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/gets.o src/stdio/gets.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getw.o src/stdio/getw.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getwc.o src/stdio/getwc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/getwchar.o src/stdio/getwchar.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/pclose.o src/stdio/pclose.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/perror.o src/stdio/perror.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/popen.o src/stdio/popen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/printf.o src/stdio/printf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putc.o src/stdio/putc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putc_unlocked.o src/stdio/putc_unlocked.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putchar.o src/stdio/putchar.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putchar_unlocked.o src/stdio/putchar_unlocked.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/puts.o src/stdio/puts.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putw.o src/stdio/putw.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putwc.o src/stdio/putwc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/putwchar.o src/stdio/putwchar.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/remove.o src/stdio/remove.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/rename.o src/stdio/rename.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/rewind.o src/stdio/rewind.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/scanf.o src/stdio/scanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/setbuf.o src/stdio/setbuf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/setvbuf.o src/stdio/setvbuf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/snprintf.o src/stdio/snprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/sprintf.o src/stdio/sprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/sscanf.o src/stdio/sscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/stderr.o src/stdio/stderr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/stdin.o src/stdio/stdin.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/stdout.o src/stdio/stdout.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/swscanf.o src/stdio/swscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/tempnam.o src/stdio/tempnam.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/tmpfile.o src/stdio/tmpfile.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/tmpnam.o src/stdio/tmpnam.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/ungetc.o src/stdio/ungetc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/ungetwc.o src/stdio/ungetwc.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vasprintf.o src/stdio/vasprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vdprintf.o src/stdio/vdprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vfprintf.o src/stdio/vfprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vfscanf.o src/stdio/vfscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vfwscanf.o src/stdio/vfwscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vprintf.o src/stdio/vprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vscanf.o src/stdio/vscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vsnprintf.o src/stdio/vsnprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vsprintf.o src/stdio/vsprintf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vsscanf.o src/stdio/vsscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vswscanf.o src/stdio/vswscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/vwscanf.o src/stdio/vwscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdio/wscanf.o src/stdio/wscanf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/abs.o src/stdlib/abs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/atof.o src/stdlib/atof.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/atoi.o src/stdlib/atoi.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/atol.o src/stdlib/atol.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/atoll.o src/stdlib/atoll.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/bsearch.o src/stdlib/bsearch.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/div.o src/stdlib/div.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/frexp.o src/stdlib/frexp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/frexpf.o src/stdlib/frexpf.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/frexpl.o src/stdlib/frexpl.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/imaxabs.o src/stdlib/imaxabs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/imaxdiv.o src/stdlib/imaxdiv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/labs.o src/stdlib/labs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/ldiv.o src/stdlib/ldiv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/llabs.o src/stdlib/llabs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/lldiv.o src/stdlib/lldiv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/qsort.o src/stdlib/qsort.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtod.o src/stdlib/strtod.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtof.o src/stdlib/strtof.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtoimax.o src/stdlib/strtoimax.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtol.o src/stdlib/strtol.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtold.o src/stdlib/strtold.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtoll.o src/stdlib/strtoll.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtoul.o src/stdlib/strtoul.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtoull.o src/stdlib/strtoull.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/strtoumax.o src/stdlib/strtoumax.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/wcstoimax.o src/stdlib/wcstoimax.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/wcstol.o src/stdlib/wcstol.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/wcstoll.o src/stdlib/wcstoll.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/wcstoul.o src/stdlib/wcstoul.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/wcstoull.o src/stdlib/wcstoull.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stdlib/wcstoumax.o src/stdlib/wcstoumax.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/bcmp.o src/string/bcmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/bcopy.o src/string/bcopy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/bzero.o src/string/bzero.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/index.o src/string/index.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/memchr.o src/string/memchr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/memcmp.o src/string/memcmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/memcpy.o src/string/memcpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/memmove.o src/string/memmove.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/mempcpy.o src/string/mempcpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/memset.o src/string/memset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/rindex.o src/string/rindex.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/stpcpy.o src/string/stpcpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/stpncpy.o src/string/stpncpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strcasecmp.o src/string/strcasecmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strcasestr.o src/string/strcasestr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strcat.o src/string/strcat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strchr.o src/string/strchr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strchrnul.o src/string/strchrnul.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strcmp.o src/string/strcmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strcpy.o src/string/strcpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strcspn.o src/string/strcspn.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strdup.o src/string/strdup.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strerror_r.o src/string/strerror_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strlcat.o src/string/strlcat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strlcpy.o src/string/strlcpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strlen.o src/string/strlen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strncasecmp.o src/string/strncasecmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strncat.o src/string/strncat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strncmp.o src/string/strncmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strncpy.o src/string/strncpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strndup.o src/string/strndup.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strnlen.o src/string/strnlen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strpbrk.o src/string/strpbrk.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strrchr.o src/string/strrchr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strsep.o src/string/strsep.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strsignal.o src/string/strsignal.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strspn.o src/string/strspn.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strstr.o src/string/strstr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strtok.o src/string/strtok.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/strtok_r.o src/string/strtok_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/swab.o src/string/swab.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcscat.o src/string/wcscat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcschr.o src/string/wcschr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcscmp.o src/string/wcscmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcscpy.o src/string/wcscpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcscspn.o src/string/wcscspn.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcslen.o src/string/wcslen.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcsncat.o src/string/wcsncat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcsncmp.o src/string/wcsncmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcsncpy.o src/string/wcsncpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcspbrk.o src/string/wcspbrk.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcsrchr.o src/string/wcsrchr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcsspn.o src/string/wcsspn.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcsstr.o src/string/wcsstr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wcswcs.o src/string/wcswcs.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wmemchr.o src/string/wmemchr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wmemcmp.o src/string/wmemcmp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wmemcpy.o src/string/wmemcpy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wmemmove.o src/string/wmemmove.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/string/wmemset.o src/string/wmemset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/stub/utmpx.o src/stub/utmpx.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/temp/mkdtemp.o src/temp/mkdtemp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/temp/mkstemp.o src/temp/mkstemp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/temp/mktemp.o src/temp/mktemp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/cfgetospeed.o src/termios/cfgetospeed.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/cfsetospeed.o src/termios/cfsetospeed.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcdrain.o src/termios/tcdrain.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcflow.o src/termios/tcflow.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcflush.o src/termios/tcflush.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcgetattr.o src/termios/tcgetattr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcgetsid.o src/termios/tcgetsid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcsendbreak.o src/termios/tcsendbreak.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/termios/tcsetattr.o src/termios/tcsetattr.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__futex.o src/thread/__futex.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__lock.o src/thread/__lock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__set_thread_area.o src/thread/x86_64/__set_thread_area.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__timedwait.o src/thread/__timedwait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__unmapself.o src/thread/x86_64/__unmapself.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__wait.o src/thread/__wait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/__wake.o src/thread/__wake.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/cancellation.o src/thread/cancellation.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/clone.o src/thread/x86_64/clone.s
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_destroy.o src/thread/pthread_attr_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_getdetachstate.o src/thread/pthread_attr_getdetachstate.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_getguardsize.o src/thread/pthread_attr_getguardsize.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_getscope.o src/thread/pthread_attr_getscope.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_getstacksize.o src/thread/pthread_attr_getstacksize.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_init.o src/thread/pthread_attr_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_setdetachstate.o src/thread/pthread_attr_setdetachstate.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_setguardsize.o src/thread/pthread_attr_setguardsize.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_setscope.o src/thread/pthread_attr_setscope.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_attr_setstacksize.o src/thread/pthread_attr_setstacksize.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_barrier_destroy.o src/thread/pthread_barrier_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_barrier_init.o src/thread/pthread_barrier_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_barrier_wait.o src/thread/pthread_barrier_wait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cancel.o src/thread/pthread_cancel.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cond_broadcast.o src/thread/pthread_cond_broadcast.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cond_destroy.o src/thread/pthread_cond_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cond_init.o src/thread/pthread_cond_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cond_signal.o src/thread/pthread_cond_signal.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cond_timedwait.o src/thread/pthread_cond_timedwait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_cond_wait.o src/thread/pthread_cond_wait.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_create.o src/thread/pthread_create.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_detach.o src/thread/pthread_detach.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_equal.o src/thread/pthread_equal.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_getspecific.o src/thread/pthread_getspecific.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_join.o src/thread/pthread_join.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_key_create.o src/thread/pthread_key_create.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_key_delete.o src/thread/pthread_key_delete.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_kill.o src/thread/pthread_kill.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutex_destroy.o src/thread/pthread_mutex_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutex_init.o src/thread/pthread_mutex_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutex_lock.o src/thread/pthread_mutex_lock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutex_timedlock.o src/thread/pthread_mutex_timedlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutex_trylock.o src/thread/pthread_mutex_trylock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutex_unlock.o src/thread/pthread_mutex_unlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutexattr_destroy.o src/thread/pthread_mutexattr_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutexattr_gettype.o src/thread/pthread_mutexattr_gettype.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutexattr_init.o src/thread/pthread_mutexattr_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_mutexattr_settype.o src/thread/pthread_mutexattr_settype.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_once.o src/thread/pthread_once.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_destroy.o src/thread/pthread_rwlock_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_init.o src/thread/pthread_rwlock_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_rdlock.o src/thread/pthread_rwlock_rdlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_timedrdlock.o src/thread/pthread_rwlock_timedrdlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_timedwrlock.o src/thread/pthread_rwlock_timedwrlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_tryrdlock.o src/thread/pthread_rwlock_tryrdlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_trywrlock.o src/thread/pthread_rwlock_trywrlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_unlock.o src/thread/pthread_rwlock_unlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_rwlock_wrlock.o src/thread/pthread_rwlock_wrlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_self.o src/thread/pthread_self.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_setcancelstate.o src/thread/pthread_setcancelstate.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_setcanceltype.o src/thread/pthread_setcanceltype.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_setspecific.o src/thread/pthread_setspecific.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_spin_destroy.o src/thread/pthread_spin_destroy.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_spin_init.o src/thread/pthread_spin_init.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_spin_lock.o src/thread/pthread_spin_lock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_spin_trylock.o src/thread/pthread_spin_trylock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_spin_unlock.o src/thread/pthread_spin_unlock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/thread/pthread_testcancel.o src/thread/pthread_testcancel.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/__asctime.o src/time/__asctime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/__time_to_tm.o src/time/__time_to_tm.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/__tm_to_time.o src/time/__tm_to_time.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/asctime.o src/time/asctime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/asctime_r.o src/time/asctime_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/clock.o src/time/clock.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/clock_gettime.o src/time/clock_gettime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/ctime.o src/time/ctime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/ctime_r.o src/time/ctime_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/difftime.o src/time/difftime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/gettimeofday.o src/time/gettimeofday.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/gmtime.o src/time/gmtime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/gmtime_r.o src/time/gmtime_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/localtime.o src/time/localtime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/localtime_r.o src/time/localtime_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/mktime.o src/time/mktime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/nanosleep.o src/time/nanosleep.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/strftime.o src/time/strftime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/strptime.o src/time/strptime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/time.o src/time/time.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/times.o src/time/times.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/tzset.o src/time/tzset.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/time/utime.o src/time/utime.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/_exit.o src/unistd/_exit.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/access.o src/unistd/access.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/alarm.o src/unistd/alarm.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/chdir.o src/unistd/chdir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/chown.o src/unistd/chown.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/close.o src/unistd/close.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/ctermid.o src/unistd/ctermid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/dup.o src/unistd/dup.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/dup2.o src/unistd/dup2.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/faccessat.o src/unistd/faccessat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/fchdir.o src/unistd/fchdir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/fchown.o src/unistd/fchown.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/fchownat.o src/unistd/fchownat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/fdatasync.o src/unistd/fdatasync.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/fsync.o src/unistd/fsync.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/ftruncate.o src/unistd/ftruncate.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getcwd.o src/unistd/getcwd.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getegid.o src/unistd/getegid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/geteuid.o src/unistd/geteuid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getgid.o src/unistd/getgid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getgroups.o src/unistd/getgroups.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/gethostname.o src/unistd/gethostname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getlogin.o src/unistd/getlogin.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getlogin_r.o src/unistd/getlogin_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getpgid.o src/unistd/getpgid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getpgrp.o src/unistd/getpgrp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getpid.o src/unistd/getpid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getppid.o src/unistd/getppid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getsid.o src/unistd/getsid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/getuid.o src/unistd/getuid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/isatty.o src/unistd/isatty.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/lchown.o src/unistd/lchown.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/link.o src/unistd/link.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/linkat.o src/unistd/linkat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/lseek.o src/unistd/lseek.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/nice.o src/unistd/nice.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/pause.o src/unistd/pause.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/pipe.o src/unistd/pipe.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/pread.o src/unistd/pread.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/pwrite.o src/unistd/pwrite.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/read.o src/unistd/read.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/readlink.o src/unistd/readlink.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/readlinkat.o src/unistd/readlinkat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/readv.o src/unistd/readv.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/renameat.o src/unistd/renameat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/rmdir.o src/unistd/rmdir.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setegid.o src/unistd/setegid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/seteuid.o src/unistd/seteuid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setgid.o src/unistd/setgid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setpgid.o src/unistd/setpgid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setpgrp.o src/unistd/setpgrp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setregid.o src/unistd/setregid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setreuid.o src/unistd/setreuid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setsid.o src/unistd/setsid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/setuid.o src/unistd/setuid.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/sleep.o src/unistd/sleep.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/symlink.o src/unistd/symlink.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/symlinkat.o src/unistd/symlinkat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/sync.o src/unistd/sync.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/tcgetpgrp.o src/unistd/tcgetpgrp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/tcsetpgrp.o src/unistd/tcsetpgrp.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/truncate.o src/unistd/truncate.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/ttyname.o src/unistd/ttyname.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/ttyname_r.o src/unistd/ttyname_r.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/ualarm.o src/unistd/ualarm.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/unlink.o src/unistd/unlink.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/unlinkat.o src/unistd/unlinkat.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/usleep.o src/unistd/usleep.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/write.o src/unistd/write.c
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o src/unistd/writev.o src/unistd/writev.c
cp ../tcc-0.9.27/lib/alloca86_64-bt.o src/alloca86_64-bt.o
cp ../tcc-0.9.27/lib/alloca86_64.o src/alloca86_64.o
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o ../tcc-0.9.27/lib/libtcc1.o ../tcc-0.9.27/lib/libtcc1.c
cp ../tcc-0.9.27/lib/libtcc1.o src/libtcc1.o
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o ../tcc-0.9.27/lib/va_list.o ../tcc-0.9.27/lib/va_list.c
cp ../tcc-0.9.27/lib/va_list.o src/va_list.o
../tcc-0.9.27/tcc -c -o src/syscall.o src/syscall.s
mkdir -p lib
../tcc-0.9.27/tcc -ar rc lib/libc.a src/conf/confstr.o src/conf/fpathconf.o src/conf/pathconf.o src/conf/sysconf.o src/ctype/__ctype_get_mb_cur_max.o src/ctype/isalnum.o src/ctype/isalpha.o src/ctype/isascii.o src/ctype/isblank.o src/ctype/iscntrl.o src/ctype/isdigit.o src/ctype/isgraph.o src/ctype/islower.o src/ctype/isprint.o src/ctype/ispunct.o src/ctype/isspace.o src/ctype/isupper.o src/ctype/iswalnum.o src/ctype/iswalpha.o src/ctype/iswblank.o src/ctype/iswcntrl.o src/ctype/iswctype.o src/ctype/iswdigit.o src/ctype/iswgraph.o src/ctype/iswlower.o src/ctype/iswprint.o src/ctype/iswpunct.o src/ctype/iswspace.o src/ctype/iswupper.o src/ctype/iswxdigit.o src/ctype/isxdigit.o src/ctype/toascii.o src/ctype/tolower.o src/ctype/toupper.o src/ctype/towctrans.o src/ctype/wcswidth.o src/ctype/wctrans.o src/ctype/wcwidth.o src/dirent/__getdents.o src/dirent/alphasort.o src/dirent/closedir.o src/dirent/dirfd.o src/dirent/fdopendir.o src/dirent/opendir.o src/dirent/readdir.o src/dirent/readdir_r.o src/dirent/rewinddir.o src/dirent/scandir.o src/dirent/seekdir.o src/dirent/telldir.o src/env/__environ.o src/env/__libc_start_main.o src/env/clearenv.o src/env/getenv.o src/env/putenv.o src/env/setenv.o src/env/unsetenv.o src/errno/__errno_location.o src/errno/strerror.o src/exit/_Exit.o src/exit/abort.o src/exit/assert.o src/exit/atexit.o src/exit/exit.o src/fcntl/creat.o src/fcntl/fcntl.o src/fcntl/open.o src/fcntl/openat.o src/internal/libc.o src/internal/syscall.o src/ipc/ftok.o src/ipc/semctl.o src/ipc/semget.o src/ipc/semop.o src/ipc/shmat.o src/ipc/shmctl.o src/ipc/shmdt.o src/ipc/shmget.o src/linux/brk.o src/linux/chroot.o src/linux/daemon.o src/linux/epoll_create.o src/linux/epoll_create1.o src/linux/epoll_ctl.o src/linux/epoll_pwait.o src/linux/epoll_wait.o src/linux/getdtablesize.o src/linux/gethostid.o src/linux/getopt_long.o src/linux/getpagesize.o src/linux/getpass.o src/linux/initgroups.o src/linux/klogctl.o src/linux/mntent.o src/linux/mount.o src/linux/prctl.o src/linux/reboot.o src/linux/sbrk.o src/linux/sendfile.o src/linux/setgroups.o src/linux/sethostname.o src/linux/settimeofday.o src/linux/signalfd.o src/linux/stime.o src/linux/swapoff.o src/linux/swapon.o src/linux/sysinfo.o src/linux/umount.o src/linux/umount2.o src/linux/utimes.o src/linux/wait3.o src/linux/wait4.o src/locale/catclose.o src/locale/catgets.o src/locale/catopen.o src/locale/duplocale.o src/locale/freelocale.o src/locale/iconv.o src/locale/intl.o src/locale/isalnum_l.o src/locale/isalpha_l.o src/locale/isblank_l.o src/locale/iscntrl_l.o src/locale/isdigit_l.o src/locale/isgraph_l.o src/locale/islower_l.o src/locale/isprint_l.o src/locale/ispunct_l.o src/locale/isspace_l.o src/locale/isupper_l.o src/locale/isxdigit_l.o src/locale/langinfo.o src/locale/localeconv.o src/locale/newlocale.o src/locale/nl_langinfo.o src/locale/setlocale.o src/locale/strcoll.o src/locale/strxfrm.o src/locale/tolower_l.o src/locale/toupper_l.o src/locale/wcscoll.o src/locale/wcsxfrm.o src/malloc/__brk.o src/malloc/__simple_malloc.o src/malloc/calloc.o src/malloc/malloc.o src/malloc/memalign.o src/malloc/posix_memalign.o src/math/__fpclassify.o src/math/__fpclassifyf.o src/math/__fpclassifyl.o src/math/e_acos.o src/math/e_acosf.o src/math/e_acosh.o src/math/e_acoshf.o src/math/e_asin.o src/math/e_asinf.o src/math/e_atan2.o src/math/e_atan2f.o src/math/e_atanh.o src/math/e_atanhf.o src/math/e_cosh.o src/math/e_coshf.o src/math/e_exp.o src/math/e_expf.o src/math/e_fmod.o src/math/e_fmodf.o src/math/e_hypot.o src/math/e_hypotf.o src/math/e_log.o src/math/e_log10.o src/math/e_log10f.o src/math/e_logf.o src/math/e_pow.o src/math/e_powf.o src/math/e_rem_pio2.o src/math/e_rem_pio2f.o src/math/e_remainder.o src/math/e_remainderf.o src/math/e_scalb.o src/math/e_scalbf.o src/math/e_sinh.o src/math/e_sinhf.o src/math/e_sqrt.o src/math/e_sqrtf.o src/math/k_cos.o src/math/k_cosf.o src/math/k_rem_pio2.o src/math/k_rem_pio2f.o src/math/k_sin.o src/math/k_sinf.o src/math/k_tan.o src/math/k_tanf.o src/math/log.o src/math/log10.o src/math/log10f.o src/math/log10l.o src/math/log1p.o src/math/log1pf.o src/math/log1pl.o src/math/log2.o src/math/log2f.o src/math/log2l.o src/math/logb.o src/math/logbf.o src/math/logbl.o src/math/logf.o src/math/logl.o src/math/s_asinh.o src/math/s_asinhf.o src/math/s_atan.o src/math/s_atanf.o src/math/s_cbrt.o src/math/s_cbrtf.o src/math/s_ceil.o src/math/s_ceilf.o src/math/s_copysign.o src/math/s_copysignf.o src/math/s_cos.o src/math/s_cosf.o src/math/s_erf.o src/math/s_erff.o src/math/s_expm1.o src/math/s_expm1f.o src/math/s_fabs.o src/math/s_fabsf.o src/math/s_floor.o src/math/s_floorf.o src/math/s_ilogb.o src/math/s_ilogbf.o src/math/s_ldexp.o src/math/s_ldexpf.o src/math/s_llrint.o src/math/s_log1p.o src/math/s_log1pf.o src/math/s_logb.o src/math/s_logbf.o src/math/s_lrint.o src/math/s_lrintf.o src/math/s_modf.o src/math/s_modff.o src/math/s_nextafter.o src/math/s_nextafterf.o src/math/s_remquo.o src/math/s_remquof.o src/math/s_rint.o src/math/s_rintf.o src/math/s_round.o src/math/s_roundf.o src/math/s_scalbln.o src/math/s_scalblnf.o src/math/s_sin.o src/math/s_sinf.o src/math/s_tan.o src/math/s_tanf.o src/math/s_tanh.o src/math/s_tanhf.o src/math/s_trunc.o src/math/s_truncf.o src/misc/basename.o src/misc/bswap_32.o src/misc/bswap_64.o src/misc/crypt.o src/misc/cuserid.o src/misc/dirname.o src/misc/ffs.o src/misc/ftw.o src/misc/getdomainname.o src/misc/getgrouplist.o src/misc/getopt.o src/misc/getpriority.o src/misc/getrlimit.o src/misc/getrusage.o src/misc/getsubopt.o src/misc/ioctl.o src/misc/lockf.o src/misc/nftw.o src/misc/openpty.o src/misc/pty.o src/misc/realpath.o src/misc/sched_yield.o src/misc/setpriority.o src/misc/setrlimit.o src/misc/syslog.o src/misc/uname.o src/mman/madvise.o src/mman/mlock.o src/mman/mlockall.o src/mman/mmap.o src/mman/mprotect.o src/mman/mremap.o src/mman/msync.o src/mman/munlock.o src/mman/munlockall.o src/mman/munmap.o src/mman/posix_madvise.o src/multibyte/btowc.o src/multibyte/decode.o src/multibyte/internal.o src/multibyte/mblen.o src/multibyte/mbrlen.o src/multibyte/mbrtowc.o src/multibyte/mbsinit.o src/multibyte/mbsnrtowcs.o src/multibyte/mbsrtowcs.o src/multibyte/mbstowcs.o src/multibyte/mbtowc.o src/multibyte/wcrtomb.o src/multibyte/wcsnrtombs.o src/multibyte/wcsrtombs.o src/multibyte/wcstombs.o src/multibyte/wctob.o src/multibyte/wctomb.o src/network/__dns.o src/network/__ipparse.o src/network/accept.o src/network/bind.o src/network/connect.o src/network/dn_expand.o src/network/ent.o src/network/freeaddrinfo.o src/network/gai_strerror.o src/network/getaddrinfo.o src/network/gethostbyaddr.o src/network/gethostbyaddr_r.o src/network/gethostbyname.o src/network/gethostbyname2.o src/network/gethostbyname2_r.o src/network/gethostbyname_r.o src/network/getnameinfo.o src/network/getpeername.o src/network/getservbyname.o src/network/getservbyname_r.o src/network/getservbyport.o src/network/getservbyport_r.o src/network/getsockname.o src/network/getsockopt.o src/network/h_errno.o src/network/hstrerror.o src/network/htonl.o src/network/htons.o src/network/in6addr_any.o src/network/in6addr_loopback.o src/network/inet_addr.o src/network/inet_aton.o src/network/inet_ntoa.o src/network/inet_ntop.o src/network/inet_pton.o src/network/listen.o src/network/ntohl.o src/network/ntohs.o src/network/proto.o src/network/recv.o src/network/recvfrom.o src/network/recvmsg.o src/network/res_init.o src/network/res_query.o src/network/send.o src/network/sendmsg.o src/network/sendto.o src/network/serv.o src/network/setsockopt.o src/network/shutdown.o src/network/sockatmark.o src/network/socket.o src/network/socketpair.o src/passwd/getgr_r.o src/passwd/getgrent.o src/passwd/getgrent_a.o src/passwd/getpw_r.o src/passwd/getpwent.o src/passwd/getpwent_a.o src/passwd/getspent.o src/passwd/getspnam.o src/passwd/getspnam_r.o src/passwd/lckpwdf.o src/prng/__rand48_step.o src/prng/__seed48.o src/prng/drand48.o src/prng/lcong48.o src/prng/lrand48.o src/prng/mrand48.o src/prng/rand.o src/prng/rand_r.o src/prng/random.o src/prng/seed48.o src/prng/srand48.o src/prng/srandom.o src/process/execl.o src/process/execle.o src/process/execlp.o src/process/execv.o src/process/execve.o src/process/execvp.o src/process/fork.o src/process/system.o src/process/vfork.o src/process/wait.o src/process/waitid.o src/process/waitpid.o src/regex/fnmatch.o src/regex/glob.o src/regex/regcomp.o src/regex/regerror.o src/regex/regexec.o src/regex/tre-mem.o src/select/poll.o src/select/pselect.o src/select/select.o src/setjmp/longjmp.o src/setjmp/setjmp.o src/signal/getitimer.o src/signal/kill.o src/signal/killpg.o src/signal/raise.o src/signal/restore.o src/signal/setitimer.o src/signal/sigaction.o src/signal/sigaddset.o src/signal/sigaltstack.o src/signal/sigdelset.o src/signal/sigemptyset.o src/signal/sigfillset.o src/signal/sighold.o src/signal/sigignore.o src/signal/siginterrupt.o src/signal/sigismember.o src/signal/siglongjmp.o src/signal/signal.o src/signal/sigpause.o src/signal/sigpending.o src/signal/sigprocmask.o src/signal/sigqueue.o src/signal/sigrelse.o src/signal/sigrtmax.o src/signal/sigrtmin.o src/signal/sigset.o src/signal/sigsetjmp.o src/signal/sigsuspend.o src/signal/sigtimedwait.o src/signal/sigwait.o src/signal/sigwaitinfo.o src/stat/chmod.o src/stat/fchmod.o src/stat/fchmodat.o src/stat/fstat.o src/stat/fstatat.o src/stat/fstatvfs.o src/stat/lstat.o src/stat/mkdir.o src/stat/mkdirat.o src/stat/mkfifo.o src/stat/mkfifoat.o src/stat/mknod.o src/stat/mknodat.o src/stat/stat.o src/stat/statvfs.o src/stat/umask.o src/stdio/__fclose_ca.o src/stdio/__fdopen.o src/stdio/__fopen_rb_ca.o src/stdio/__fpending.o src/stdio/__ofl.o src/stdio/__overflow.o src/stdio/__scanf.o src/stdio/__stdio_close.o src/stdio/__stdio_read.o src/stdio/__stdio_seek.o src/stdio/__stdio_write.o src/stdio/__uflow.o src/stdio/__underflow.o src/stdio/asprintf.o src/stdio/clearerr.o src/stdio/dprintf.o src/stdio/fclose.o src/stdio/feof.o src/stdio/ferror.o src/stdio/fflush.o src/stdio/fgetc.o src/stdio/fgetpos.o src/stdio/fgets.o src/stdio/fgetwc.o src/stdio/fgetws.o src/stdio/fileno.o src/stdio/fmemopen.o src/stdio/fopen.o src/stdio/fprintf.o src/stdio/fputc.o src/stdio/fputs.o src/stdio/fputwc.o src/stdio/fputws.o src/stdio/fread.o src/stdio/freopen.o src/stdio/fscanf.o src/stdio/fseek.o src/stdio/fsetpos.o src/stdio/ftell.o src/stdio/fwide.o src/stdio/fwrite.o src/stdio/fwscanf.o src/stdio/getc.o src/stdio/getc_unlocked.o src/stdio/getchar.o src/stdio/getchar_unlocked.o src/stdio/getdelim.o src/stdio/getline.o src/stdio/gets.o src/stdio/getw.o src/stdio/getwc.o src/stdio/getwchar.o src/stdio/pclose.o src/stdio/perror.o src/stdio/popen.o src/stdio/printf.o src/stdio/putc.o src/stdio/putc_unlocked.o src/stdio/putchar.o src/stdio/putchar_unlocked.o src/stdio/puts.o src/stdio/putw.o src/stdio/putwc.o src/stdio/putwchar.o src/stdio/remove.o src/stdio/rename.o src/stdio/rewind.o src/stdio/scanf.o src/stdio/setbuf.o src/stdio/setvbuf.o src/stdio/snprintf.o src/stdio/sprintf.o src/stdio/sscanf.o src/stdio/stderr.o src/stdio/stdin.o src/stdio/stdout.o src/stdio/swscanf.o src/stdio/tempnam.o src/stdio/tmpfile.o src/stdio/tmpnam.o src/stdio/ungetc.o src/stdio/ungetwc.o src/stdio/vasprintf.o src/stdio/vdprintf.o src/stdio/vfprintf.o src/stdio/vfscanf.o src/stdio/vfwscanf.o src/stdio/vprintf.o src/stdio/vscanf.o src/stdio/vsnprintf.o src/stdio/vsprintf.o src/stdio/vsscanf.o src/stdio/vswscanf.o src/stdio/vwscanf.o src/stdio/wscanf.o src/stdlib/abs.o src/stdlib/atof.o src/stdlib/atoi.o src/stdlib/atol.o src/stdlib/atoll.o src/stdlib/bsearch.o src/stdlib/div.o src/stdlib/frexp.o src/stdlib/frexpf.o src/stdlib/frexpl.o src/stdlib/imaxabs.o src/stdlib/imaxdiv.o src/stdlib/labs.o src/stdlib/ldiv.o src/stdlib/llabs.o src/stdlib/lldiv.o src/stdlib/qsort.o src/stdlib/strtod.o src/stdlib/strtof.o src/stdlib/strtoimax.o src/stdlib/strtol.o src/stdlib/strtold.o src/stdlib/strtoll.o src/stdlib/strtoul.o src/stdlib/strtoull.o src/stdlib/strtoumax.o src/stdlib/wcstoimax.o src/stdlib/wcstol.o src/stdlib/wcstoll.o src/stdlib/wcstoul.o src/stdlib/wcstoull.o src/stdlib/wcstoumax.o src/string/bcmp.o src/string/bcopy.o src/string/bzero.o src/string/index.o src/string/memchr.o src/string/memcmp.o src/string/memcpy.o src/string/memmove.o src/string/mempcpy.o src/string/memset.o src/string/rindex.o src/string/stpcpy.o src/string/stpncpy.o src/string/strcasecmp.o src/string/strcasestr.o src/string/strcat.o src/string/strchr.o src/string/strchrnul.o src/string/strcmp.o src/string/strcpy.o src/string/strcspn.o src/string/strdup.o src/string/strerror_r.o src/string/strlcat.o src/string/strlcpy.o src/string/strlen.o src/string/strncasecmp.o src/string/strncat.o src/string/strncmp.o src/string/strncpy.o src/string/strndup.o src/string/strnlen.o src/string/strpbrk.o src/string/strrchr.o src/string/strsep.o src/string/strsignal.o src/string/strspn.o src/string/strstr.o src/string/strtok.o src/string/strtok_r.o src/string/swab.o src/string/wcscat.o src/string/wcschr.o src/string/wcscmp.o src/string/wcscpy.o src/string/wcscspn.o src/string/wcslen.o src/string/wcsncat.o src/string/wcsncmp.o src/string/wcsncpy.o src/string/wcspbrk.o src/string/wcsrchr.o src/string/wcsspn.o src/string/wcsstr.o src/string/wcswcs.o src/string/wmemchr.o src/string/wmemcmp.o src/string/wmemcpy.o src/string/wmemmove.o src/string/wmemset.o src/stub/utmpx.o src/temp/mkdtemp.o src/temp/mkstemp.o src/temp/mktemp.o src/termios/cfgetospeed.o src/termios/cfsetospeed.o src/termios/tcdrain.o src/termios/tcflow.o src/termios/tcflush.o src/termios/tcgetattr.o src/termios/tcgetsid.o src/termios/tcsendbreak.o src/termios/tcsetattr.o src/thread/__futex.o src/thread/__lock.o src/thread/__set_thread_area.o src/thread/__timedwait.o src/thread/__unmapself.o src/thread/__wait.o src/thread/__wake.o src/thread/cancellation.o src/thread/clone.o src/thread/pthread_attr_destroy.o src/thread/pthread_attr_getdetachstate.o src/thread/pthread_attr_getguardsize.o src/thread/pthread_attr_getscope.o src/thread/pthread_attr_getstacksize.o src/thread/pthread_attr_init.o src/thread/pthread_attr_setdetachstate.o src/thread/pthread_attr_setguardsize.o src/thread/pthread_attr_setscope.o src/thread/pthread_attr_setstacksize.o src/thread/pthread_barrier_destroy.o src/thread/pthread_barrier_init.o src/thread/pthread_barrier_wait.o src/thread/pthread_cancel.o src/thread/pthread_cond_broadcast.o src/thread/pthread_cond_destroy.o src/thread/pthread_cond_init.o src/thread/pthread_cond_signal.o src/thread/pthread_cond_timedwait.o src/thread/pthread_cond_wait.o src/thread/pthread_create.o src/thread/pthread_detach.o src/thread/pthread_equal.o src/thread/pthread_getspecific.o src/thread/pthread_join.o src/thread/pthread_key_create.o src/thread/pthread_key_delete.o src/thread/pthread_kill.o src/thread/pthread_mutex_destroy.o src/thread/pthread_mutex_init.o src/thread/pthread_mutex_lock.o src/thread/pthread_mutex_timedlock.o src/thread/pthread_mutex_trylock.o src/thread/pthread_mutex_unlock.o src/thread/pthread_mutexattr_destroy.o src/thread/pthread_mutexattr_gettype.o src/thread/pthread_mutexattr_init.o src/thread/pthread_mutexattr_settype.o src/thread/pthread_once.o src/thread/pthread_rwlock_destroy.o src/thread/pthread_rwlock_init.o src/thread/pthread_rwlock_rdlock.o src/thread/pthread_rwlock_timedrdlock.o src/thread/pthread_rwlock_timedwrlock.o src/thread/pthread_rwlock_tryrdlock.o src/thread/pthread_rwlock_trywrlock.o src/thread/pthread_rwlock_unlock.o src/thread/pthread_rwlock_wrlock.o src/thread/pthread_self.o src/thread/pthread_setcancelstate.o src/thread/pthread_setcanceltype.o src/thread/pthread_setspecific.o src/thread/pthread_spin_destroy.o src/thread/pthread_spin_init.o src/thread/pthread_spin_lock.o src/thread/pthread_spin_trylock.o src/thread/pthread_spin_unlock.o src/thread/pthread_testcancel.o src/time/__asctime.o src/time/__time_to_tm.o src/time/__tm_to_time.o src/time/asctime.o src/time/asctime_r.o src/time/clock.o src/time/clock_gettime.o src/time/ctime.o src/time/ctime_r.o src/time/difftime.o src/time/gettimeofday.o src/time/gmtime.o src/time/gmtime_r.o src/time/localtime.o src/time/localtime_r.o src/time/mktime.o src/time/nanosleep.o src/time/strftime.o src/time/strptime.o src/time/time.o src/time/times.o src/time/tzset.o src/time/utime.o src/unistd/_exit.o src/unistd/access.o src/unistd/alarm.o src/unistd/chdir.o src/unistd/chown.o src/unistd/close.o src/unistd/ctermid.o src/unistd/dup.o src/unistd/dup2.o src/unistd/faccessat.o src/unistd/fchdir.o src/unistd/fchown.o src/unistd/fchownat.o src/unistd/fdatasync.o src/unistd/fsync.o src/unistd/ftruncate.o src/unistd/getcwd.o src/unistd/getegid.o src/unistd/geteuid.o src/unistd/getgid.o src/unistd/getgroups.o src/unistd/gethostname.o src/unistd/getlogin.o src/unistd/getlogin_r.o src/unistd/getpgid.o src/unistd/getpgrp.o src/unistd/getpid.o src/unistd/getppid.o src/unistd/getsid.o src/unistd/getuid.o src/unistd/isatty.o src/unistd/lchown.o src/unistd/link.o src/unistd/linkat.o src/unistd/lseek.o src/unistd/nice.o src/unistd/pause.o src/unistd/pipe.o src/unistd/pread.o src/unistd/pwrite.o src/unistd/read.o src/unistd/readlink.o src/unistd/readlinkat.o src/unistd/readv.o src/unistd/renameat.o src/unistd/rmdir.o src/unistd/setegid.o src/unistd/seteuid.o src/unistd/setgid.o src/unistd/setpgid.o src/unistd/setpgrp.o src/unistd/setregid.o src/unistd/setreuid.o src/unistd/setsid.o src/unistd/setuid.o src/unistd/sleep.o src/unistd/symlink.o src/unistd/symlinkat.o src/unistd/sync.o src/unistd/tcgetpgrp.o src/unistd/tcsetpgrp.o src/unistd/truncate.o src/unistd/ttyname.o src/unistd/ttyname_r.o src/unistd/ualarm.o src/unistd/unlink.o src/unistd/unlinkat.o src/unistd/usleep.o src/unistd/write.o src/unistd/writev.o src/alloca86_64-bt.o src/alloca86_64.o src/libtcc1.o src/va_list.o src/syscall.o 
#  lib/libc.a
install -D -m 644 lib/libc.a ../musl-bootstrap-final/lib/libc.a
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o crt/crt1.o crt/x86_64/crt1.s
cp crt/crt1.o lib/crt1.o
install -D -m 644 lib/crt1.o ../musl-bootstrap-final/lib/crt1.o
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o crt/crti.o crt/crti.c
cp crt/crti.o lib/crti.o
install -D -m 644 lib/crti.o ../musl-bootstrap-final/lib/crti.o
../tcc-0.9.27/tcc -Os -nostdinc -ffreestanding -std=c99 -D_XOPEN_SOURCE=700 -pipe -g -I./include -I./src/internal -I./arch/x86_64 -c -o crt/crtn.o crt/crtn.c
cp crt/crtn.o lib/crtn.o
install -D -m 644 include/bits/alltypes.h ../musl-bootstrap-final/include/bits/alltypes.h
cp -r include/bits/* ../musl-bootstrap-final/include/bits
install -D -m 644 lib/crtn.o ../musl-bootstrap-final/lib/crtn.o
install -D -m 644 include/alloca.h ../musl-bootstrap-final/include/alloca.h
install -D -m 644 include/arpa/inet.h ../musl-bootstrap-final/include/arpa/inet.h
install -D -m 644 include/arpa/nameser.h ../musl-bootstrap-final/include/arpa/nameser.h
install -D -m 644 include/arpa/telnet.h ../musl-bootstrap-final/include/arpa/telnet.h
install -D -m 644 include/assert.h ../musl-bootstrap-final/include/assert.h
install -D -m 644 include/byteswap.h ../musl-bootstrap-final/include/byteswap.h
install -D -m 644 include/cpio.h ../musl-bootstrap-final/include/cpio.h
install -D -m 644 include/ctype.h ../musl-bootstrap-final/include/ctype.h
install -D -m 644 include/dirent.h ../musl-bootstrap-final/include/dirent.h
install -D -m 644 include/elf.h ../musl-bootstrap-final/include/elf.h
install -D -m 644 include/endian.h ../musl-bootstrap-final/include/endian.h
install -D -m 644 include/errno.h ../musl-bootstrap-final/include/errno.h
install -D -m 644 include/fcntl.h ../musl-bootstrap-final/include/fcntl.h
install -D -m 644 include/features.h ../musl-bootstrap-final/include/features.h
install -D -m 644 include/fenv.h ../musl-bootstrap-final/include/fenv.h
install -D -m 644 include/float.h ../musl-bootstrap-final/include/float.h
install -D -m 644 include/fnmatch.h ../musl-bootstrap-final/include/fnmatch.h
install -D -m 644 include/ftw.h ../musl-bootstrap-final/include/ftw.h
install -D -m 644 include/getopt.h ../musl-bootstrap-final/include/getopt.h
install -D -m 644 include/glob.h ../musl-bootstrap-final/include/glob.h
install -D -m 644 include/grp.h ../musl-bootstrap-final/include/grp.h
install -D -m 644 include/iconv.h ../musl-bootstrap-final/include/iconv.h
install -D -m 644 include/inttypes.h ../musl-bootstrap-final/include/inttypes.h
install -D -m 644 include/iso646.h ../musl-bootstrap-final/include/iso646.h
install -D -m 644 include/langinfo.h ../musl-bootstrap-final/include/langinfo.h
install -D -m 644 include/libgen.h ../musl-bootstrap-final/include/libgen.h
install -D -m 644 include/libintl.h ../musl-bootstrap-final/include/libintl.h
install -D -m 644 include/limits.h ../musl-bootstrap-final/include/limits.h
install -D -m 644 include/linux/loop.h ../musl-bootstrap-final/include/linux/loop.h
install -D -m 644 include/linux/version.h ../musl-bootstrap-final/include/linux/version.h
install -D -m 644 include/locale.h ../musl-bootstrap-final/include/locale.h
install -D -m 644 include/malloc.h ../musl-bootstrap-final/include/malloc.h
install -D -m 644 include/math.h ../musl-bootstrap-final/include/math.h
install -D -m 644 include/mntent.h ../musl-bootstrap-final/include/mntent.h
install -D -m 644 include/net/ethernet.h ../musl-bootstrap-final/include/net/ethernet.h
install -D -m 644 include/net/if.h ../musl-bootstrap-final/include/net/if.h
install -D -m 644 include/net/if_arp.h ../musl-bootstrap-final/include/net/if_arp.h
install -D -m 644 include/net/route.h ../musl-bootstrap-final/include/net/route.h
install -D -m 644 include/netdb.h ../musl-bootstrap-final/include/netdb.h
install -D -m 644 include/netinet/icmp6.h ../musl-bootstrap-final/include/netinet/icmp6.h
install -D -m 644 include/netinet/if_ether.h ../musl-bootstrap-final/include/netinet/if_ether.h
install -D -m 644 include/netinet/in.h ../musl-bootstrap-final/include/netinet/in.h
install -D -m 644 include/netinet/ip.h ../musl-bootstrap-final/include/netinet/ip.h
install -D -m 644 include/netinet/ip6.h ../musl-bootstrap-final/include/netinet/ip6.h
install -D -m 644 include/netinet/ip_icmp.h ../musl-bootstrap-final/include/netinet/ip_icmp.h
install -D -m 644 include/netinet/tcp.h ../musl-bootstrap-final/include/netinet/tcp.h
install -D -m 644 include/netinet/udp.h ../musl-bootstrap-final/include/netinet/udp.h
install -D -m 644 include/nl_types.h ../musl-bootstrap-final/include/nl_types.h
install -D -m 644 include/paths.h ../musl-bootstrap-final/include/paths.h
install -D -m 644 include/poll.h ../musl-bootstrap-final/include/poll.h
install -D -m 644 include/pthread.h ../musl-bootstrap-final/include/pthread.h
install -D -m 644 include/pty.h ../musl-bootstrap-final/include/pty.h
install -D -m 644 include/pwd.h ../musl-bootstrap-final/include/pwd.h
install -D -m 644 include/regex.h ../musl-bootstrap-final/include/regex.h
install -D -m 644 include/resolv.h ../musl-bootstrap-final/include/resolv.h
install -D -m 644 include/sched.h ../musl-bootstrap-final/include/sched.h
install -D -m 644 include/search.h ../musl-bootstrap-final/include/search.h
install -D -m 644 include/semaphore.h ../musl-bootstrap-final/include/semaphore.h
install -D -m 644 include/setjmp.h ../musl-bootstrap-final/include/setjmp.h
install -D -m 644 include/shadow.h ../musl-bootstrap-final/include/shadow.h
install -D -m 644 include/signal.h ../musl-bootstrap-final/include/signal.h
install -D -m 644 include/stdarg.h ../musl-bootstrap-final/include/stdarg.h
install -D -m 644 include/stdbool.h ../musl-bootstrap-final/include/stdbool.h
install -D -m 644 include/stddef.h ../musl-bootstrap-final/include/stddef.h
install -D -m 644 include/stdint.h ../musl-bootstrap-final/include/stdint.h
install -D -m 644 include/stdio.h ../musl-bootstrap-final/include/stdio.h
install -D -m 644 include/stdlib.h ../musl-bootstrap-final/include/stdlib.h
install -D -m 644 include/string.h ../musl-bootstrap-final/include/string.h
install -D -m 644 include/strings.h ../musl-bootstrap-final/include/strings.h
install -D -m 644 include/stropts.h ../musl-bootstrap-final/include/stropts.h
install -D -m 644 include/sys/epoll.h ../musl-bootstrap-final/include/sys/epoll.h
install -D -m 644 include/sys/file.h ../musl-bootstrap-final/include/sys/file.h
install -D -m 644 include/sys/ioctl.h ../musl-bootstrap-final/include/sys/ioctl.h
install -D -m 644 include/sys/ipc.h ../musl-bootstrap-final/include/sys/ipc.h
install -D -m 644 include/sys/kd.h ../musl-bootstrap-final/include/sys/kd.h
install -D -m 644 include/sys/klog.h ../musl-bootstrap-final/include/sys/klog.h
install -D -m 644 include/sys/mman.h ../musl-bootstrap-final/include/sys/mman.h
install -D -m 644 include/sys/mount.h ../musl-bootstrap-final/include/sys/mount.h
install -D -m 644 include/sys/msg.h ../musl-bootstrap-final/include/sys/msg.h
install -D -m 644 include/sys/mtio.h ../musl-bootstrap-final/include/sys/mtio.h
install -D -m 644 include/sys/param.h ../musl-bootstrap-final/include/sys/param.h
install -D -m 644 include/sys/poll.h ../musl-bootstrap-final/include/sys/poll.h
install -D -m 644 include/sys/prctl.h ../musl-bootstrap-final/include/sys/prctl.h
install -D -m 644 include/sys/procfs.h ../musl-bootstrap-final/include/sys/procfs.h
install -D -m 644 include/sys/ptrace.h ../musl-bootstrap-final/include/sys/ptrace.h
install -D -m 644 include/sys/reboot.h ../musl-bootstrap-final/include/sys/reboot.h
install -D -m 644 include/sys/reg.h ../musl-bootstrap-final/include/sys/reg.h
install -D -m 644 include/sys/resource.h ../musl-bootstrap-final/include/sys/resource.h
install -D -m 644 include/sys/select.h ../musl-bootstrap-final/include/sys/select.h
install -D -m 644 include/sys/sem.h ../musl-bootstrap-final/include/sys/sem.h
install -D -m 644 include/sys/shm.h ../musl-bootstrap-final/include/sys/shm.h
install -D -m 644 include/sys/signalfd.h ../musl-bootstrap-final/include/sys/signalfd.h
install -D -m 644 include/sys/socket.h ../musl-bootstrap-final/include/sys/socket.h
install -D -m 644 include/sys/soundcard.h ../musl-bootstrap-final/include/sys/soundcard.h
install -D -m 644 include/sys/stat.h ../musl-bootstrap-final/include/sys/stat.h
install -D -m 644 include/sys/statfs.h ../musl-bootstrap-final/include/sys/statfs.h
install -D -m 644 include/sys/statvfs.h ../musl-bootstrap-final/include/sys/statvfs.h
install -D -m 644 include/sys/stropts.h ../musl-bootstrap-final/include/sys/stropts.h
install -D -m 644 include/sys/swap.h ../musl-bootstrap-final/include/sys/swap.h
install -D -m 644 include/sys/sysctl.h ../musl-bootstrap-final/include/sys/sysctl.h
install -D -m 644 include/sys/sysinfo.h ../musl-bootstrap-final/include/sys/sysinfo.h
install -D -m 644 include/sys/sysmacros.h ../musl-bootstrap-final/include/sys/sysmacros.h
install -D -m 644 include/sys/time.h ../musl-bootstrap-final/include/sys/time.h
install -D -m 644 include/sys/times.h ../musl-bootstrap-final/include/sys/times.h
install -D -m 644 include/sys/types.h ../musl-bootstrap-final/include/sys/types.h
install -D -m 644 include/sys/ucontext.h ../musl-bootstrap-final/include/sys/ucontext.h
install -D -m 644 include/sys/uio.h ../musl-bootstrap-final/include/sys/uio.h
install -D -m 644 include/sys/un.h ../musl-bootstrap-final/include/sys/un.h
install -D -m 644 include/sys/user.h ../musl-bootstrap-final/include/sys/user.h
install -D -m 644 include/sys/utsname.h ../musl-bootstrap-final/include/sys/utsname.h
install -D -m 644 include/sys/vfs.h ../musl-bootstrap-final/include/sys/vfs.h
install -D -m 644 include/sys/vt.h ../musl-bootstrap-final/include/sys/vt.h
install -D -m 644 include/sys/wait.h ../musl-bootstrap-final/include/sys/wait.h
install -D -m 644 include/syslog.h ../musl-bootstrap-final/include/syslog.h
install -D -m 644 include/tar.h ../musl-bootstrap-final/include/tar.h
install -D -m 644 include/termios.h ../musl-bootstrap-final/include/termios.h
install -D -m 644 include/time.h ../musl-bootstrap-final/include/time.h
install -D -m 644 include/ucontext.h ../musl-bootstrap-final/include/ucontext.h
install -D -m 644 include/ulimit.h ../musl-bootstrap-final/include/ulimit.h
install -D -m 644 include/unistd.h ../musl-bootstrap-final/include/unistd.h
install -D -m 644 include/utime.h ../musl-bootstrap-final/include/utime.h
install -D -m 644 include/utmp.h ../musl-bootstrap-final/include/utmp.h
install -D -m 644 include/utmpx.h ../musl-bootstrap-final/include/utmpx.h
install -D -m 644 include/wchar.h ../musl-bootstrap-final/include/wchar.h
install -D -m 644 include/wctype.h ../musl-bootstrap-final/include/wctype.h
install -D -m 644 include/wordexp.h ../musl-bootstrap-final/include/wordexp.h
