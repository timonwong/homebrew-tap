# Homebrew tap

Homebrew formulae for projects maintained by [Timon Wong](https://github.com/timonwong).
The tap contains [jiro](https://github.com/timonwong/jiro) and
[skimi](https://github.com/timonwong/skimi).

## Install jiro

```sh
brew install timonwong/tap/jiro
```

## Install skimi

```sh
brew install timonwong/tap/skimi
```

Each project's release workflow updates its formula immediately after GoReleaser
OSS publishes a release, using a dedicated write deploy key scoped only to this
repository. A scheduled workflow also reconciles each formula with its latest
stable GitHub Release every six hours.
