## Redox Toolchain Bootstrap

An attempt to bootstrap the redox toolchain from a small binary seed.

## Build

Currently takes 24 hours to fully build (not exaggerating).

Requires latest version of proot to be installed and available in your PATH.
Makefile build assuming you're on a linux distro with utlities installed. May or
may not work, easy to debug and start or stop mid way.
```
make
```

CI build. If it crashes you'll need to re-run the whole thing but compiling it
this way is tested on CI so it should work.
```
./build.sh
```

## Documentation

- [TinyCC Boostrap (stages 1-5)](./docs/BOOSTRAP.md)
- [TinyCC -> GNU Linux Chroot (stage 6)](./06/README.md)
- GNU Linux Chroot (stage 7) -> Redox Toolchain

## TODO

- Move rust boostrap into stage 06, its in 07 right now because its much easier to build mrustc in a normal gnu fs compared to stage 06.
    - Doing this should theoretically make it possible to cross compile the final file system to a different architecture.
    - Try cross compiling to a different architecture in stage 06
- Compile busybox and static proot in stage 04b or 05a to make it possible to build the project with sh being the only dependency.
    - requires mkdir, cp
