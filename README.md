# Homebrew tap

Homebrew formulae for projects maintained by [Timon Wong](https://github.com/timonwong).
The tap currently contains only [jiro](https://github.com/timonwong/jiro).

## Install jiro

```sh
brew install timonwong/tap/jiro
```

The `jiro` release workflow updates the formula immediately after GoReleaser OSS
publishes a release, using a write deploy key scoped only to this repository. A
scheduled workflow also reconciles it with the latest stable GitHub Release every
six hours.
