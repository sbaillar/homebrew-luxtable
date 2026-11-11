# Homebrew tap for Luxtable

[Luxtable](https://github.com/sbaillar/luxtable) is a fast, local-first RAW photo workflow app for macOS (Apple silicon, macOS 26 or later).

## Install

```sh
brew install --cask sbaillar/luxtable/luxtable
```

Use the full name, `sbaillar/luxtable/luxtable`. Since Homebrew 6, a tap outside Homebrew's own needs your explicit trust before its code is loaded ([Tap Trust](https://docs.brew.sh/Tap-Trust)). Installing by the full name trusts this one cask and nothing else in the tap.

Luxtable is signed with its own certificate and is not notarized by Apple, so macOS blocks the first launch. Open Luxtable once, then choose System Settings ▸ Privacy & Security ▸ **Open Anyway**.

## Update and remove

```sh
brew upgrade --cask luxtable      # Luxtable also updates itself (Settings ▸ Updates)
brew uninstall --cask luxtable
brew uninstall --zap --cask luxtable   # also removes Luxtable's settings and caches, not your photos or sessions
```

## What is checked

- **The download.** The cask pins the disk image's SHA-256, and Homebrew refuses a file that doesn't match.
- **The release.** Luxtable's GitHub releases are immutable: once published, a release's files and tag can't be changed, and GitHub signs an attestation for it. To check a release yourself, with the [GitHub CLI](https://cli.github.com):

  ```sh
  gh release verify v<version> -R sbaillar/luxtable
  gh release verify-asset v<version> Luxtable-<version>-macos-arm64.dmg -R sbaillar/luxtable
  ```

  This applies to releases after 0.5.4, which was published before immutable releases were turned on.
- **The cask.** Every change to this tap runs `brew style` and `brew audit` in GitHub Actions.

The cask is written by `scripts/update-cask.sh` in the Luxtable repository when a release is published.
