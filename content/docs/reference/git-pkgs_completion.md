---
title: "git-pkgs completion"
description: "Generate shell completions"
weight: 10
---

Generate shell completions

Generate shell completion scripts for git-pkgs.

To load completions:

Bash:
  $ source <(git pkgs completion bash)
  # To load completions for each session, execute once:
  # Linux:
  $ git pkgs completion bash > /etc/bash_completion.d/git-pkgs
  # macOS:
  $ git pkgs completion bash > $(brew --prefix)/etc/bash_completion.d/git-pkgs

Zsh:
  # If shell completion is not already enabled in your environment,
  # you will need to enable it. You can execute the following once:
  $ echo "autoload -U compinit; compinit" >> ~/.zshrc

  # To load completions for each session, execute once:
  $ git pkgs completion zsh > "${fpath[1]}/_git-pkgs"

  # You will need to start a new shell for this setup to take effect.

Fish:
  $ git pkgs completion fish | source
  # To load completions for each session, execute once:
  $ git pkgs completion fish > ~/.config/fish/completions/git-pkgs.fish

PowerShell:
  PS> git pkgs completion powershell | Out-String | Invoke-Expression
  # To load completions for every new session, run:
  PS> git pkgs completion powershell > git-pkgs.ps1
  # and source this file from your PowerShell profile.


```
git-pkgs completion [shell]
```

### Options

```
  -h, --help   help for completion
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
