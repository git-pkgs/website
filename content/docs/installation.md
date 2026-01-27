---
title: Installation
weight: 5
---

## Homebrew

```bash
brew tap git-pkgs/git-pkgs
brew install git-pkgs
```

## Download binary

Download a prebuilt binary from the [releases page](https://github.com/git-pkgs/git-pkgs/releases).

Binaries are available for:
- macOS (Intel and Apple Silicon)
- Linux (amd64 and arm64)
- Windows (amd64)

Each release includes man pages in the archive. Copy them to your man path (e.g., `/usr/local/share/man/man1/`) to enable `man git-pkgs`.

## Build from source

Requires Go 1.22 or later.

```bash
go install github.com/git-pkgs/git-pkgs@latest
```

## Verify installation

```bash
git pkgs --version
```

## Shell completions

Generate completions for your shell:

```bash
git pkgs completion bash > /etc/bash_completion.d/git-pkgs
git pkgs completion zsh > "${fpath[1]}/_git-pkgs"
git pkgs completion fish > ~/.config/fish/completions/git-pkgs.fish
```

## Next steps

Initialize git-pkgs in a repository:

```bash
cd your-repo
git pkgs init
```

See [Getting Started](/docs/getting-started) for a walkthrough of the main commands.
