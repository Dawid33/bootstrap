## Redox Toolchain Bootstrap

An attempt to bootstrap the redox toolchain from a small binary seed.

```
docker run --rm -it $(docker build -q .)
```

## Documentation

- [TinyCC Boostrap (stages 1-5)](./BOOSTRAP.md)
- [TinyCC -> GNU Linux Chroot (stage 6)](./06/README.md)
- [GNU Linux Chroot (stage 7) -> Redox Toolchain](./07/README.md)


