---
title: "git-pkgs bisect run"
description: "Automate bisect with a command"
weight: 10
---

Automate bisect with a command

Automatically run a command at each bisect step. The command's exit code
determines whether the commit is good or bad:
  Exit 0     = good
  Exit 1-124 = bad
  Exit 125   = skip (can't test this commit)
  Exit 126+  = abort bisect

```
git-pkgs bisect run <cmd> [<args>...] [flags]
```

### Options

```
  -h, --help   help for run
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
