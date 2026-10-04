# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A from-source bootstrap of the Redox toolchain starting from a tiny hand-written binary seed. Each numbered directory is a stage whose output is the input to the next; nothing from the host compiler toolchain is meant to leak into the result. A full build takes ~24 hours, so never kick off the whole chain to "check" a change — run only the stage/recipe you touched.

## Working in this repo

Never create git worktrees here (no `EnterWorktree`, no `git worktree add`) — work directly in the main checkout on `trunk`. Build outputs (`06/stage`, `07/fs`, downloads) are huge and live only in the main checkout.

## Stage pipeline

| Stage | What it is | Built by |
|---|---|---|
| `00`–`04a` | Hand-written hex → progressively richer languages (labels, functions, a preprocessor). Each stage's `inNN` is compiled by the previous stage's `outNN`. | `make -C NN` |
| `05` | A C compiler written in the `04` language (`*.b`) that compiles a patched tcc 0.9.27 + musl 0.6.0, then `tcc-final`. | `make -C 05` (`testapp` target builds `test.c` with the final tcc) |
| `06` | Uses `05/tcc-final/out/tcc` as the seed to build a full GNU/Linux rootfs in `06/stage` (gcc, clang, musl, glibc, perl, python…) via shell recipes. | `06/Makefile`, `ci/rooted_06`, `build.sh` |
| `07` | Copies `06/stage/fs` into `07/fs`, chroots into it, and builds the Rust toolchain (mrustc → rustc 1.90 → … → nightly) plus extras (e.g. ftl). | `07/build_fs.sh`, then `07/ci.sh <recipe>` |

Docs: `docs/BOOTSTRAP.md` (stages 00–05, including the x86-64 instruction subset used by the hand-written stages), and each stage's `README.md`.

## Commands

- Stages 00–05: `make` at the top level (runs `make -C` for 00..05; 06 is commented out). `make clean` likewise.
- CI-equivalent full run: `./build.sh` (stages 0–5 via `ci/initboot.sh` under `ci/rooted`, then every 06 recipe via `ci/rooted_06`). The Forgejo workflow `.forgejo/workflows/build.yaml` is the canonical step list, including the 07 fs setup and `07/bundle.sh` (podman image push). `.github/workflows/build.yaml` is the GitHub Actions port: the same steps split into chained jobs on GitHub-hosted runners (6h each), passing the workspace as tar artifacts and streaming source tarballs from the `ghcr.io/dawid33/strap-ci-base` image (`ci/fetch_ci_sources.sh`); rebuild and push that image with `ci/publish_ci_image.sh`.
- Run a single 06 recipe: `./ci/rooted_06 /recipes/<name>.sh` (proot into `06/stage` with `/dev` bound). 06 recipe tests are the `06/recipes/_<id>.test.sh` scripts, run the same way.
- 07: `cd 07 && ./build_fs.sh` (downloads sources and assembles `fs/` from `../06/stage/fs`), then from the repo root `07/ci.sh <recipe>.sh` runs one recipe inside `07/fs` via `/usr/local/bin/proot` (binds host `/dev`, `/etc`, `/proc`). `07/recipes/all-stages.sh` is the ordered list. `07/chroot.sh` gives an interactive shell in `fs`.
- Requires a recent `proot` on PATH (or `/usr/local/bin/proot` for 07). `ci/rooted` uses the bundled `ci/bin/proot` with a scrubbed env.

## Recipes and sources

- Recipes are plain shell scripts executed *inside* the stage's rootfs, so paths are rootfs paths: 06 recipes read `/downloads/...` and install to `/store/<recipe-name>`, setting PATH explicitly from earlier `/store/*/bin` dirs; 07 recipes read `/tmp/downloads/...`, build in `/tmp/<name>`, and install into `/usr` or `/usr/local`.
- Source tarballs are declared in the recipe itself with `#> FETCH <sha256>` / `#>  FROM <url>` / optional `#>    AS <file>` comment lines; the stage's download script (`06/helpers/download.sh`, `07/download.sh`) scans recipes, fetches and sha256-verifies them. In `07/download.sh` a block is only emitted when a non-`#>` line follows it, so separate consecutive FETCH blocks with a bare `#` line. Older 07 sources are also listed explicitly at the top of `07/download.sh` (mirrored on static.dawidsobczak.com).
- `06/helpers/seed.sh` substitutes `$NPROC` into the copied recipes; 06 recipes start with `#!/store/1-stage1/protobusybox/bin/ash` and the 06 Makefile marks completion by touching `stage/pkgs/<name>`.
- 07 Rust chain: each `temp-rust-1.N.sh` builds rustc from source with `x.py build --stage 3`, using the previous version's `build/x86_64-unknown-linux-gnu/stage3` rustc and `stage2-tools-bin/cargo` from `/tmp/temp-rust-1.(N-1)` (vendored, `download-ci-llvm = false`); only the final `host-rust-*.sh` runs `x.py install`. Keep that chaining intact when adding/removing versions.
- Inside 07's fs, `/usr/busybox/bin` holds busybox applets; many recipes prepend it to PATH, which shadows GNU tools (e.g. busybox `cpio` lacks `-0`) — append it instead when a recipe needs the GNU version.

## Generated / ignored

`06/stage`, `07/fs`, `07/downloads/*`, `outNN` binaries and `07/rust-temp` are build outputs (gitignored). `.gitmodules` still lists a `07/root/redox` submodule (private Forgejo remote) that is not present in the tree.
