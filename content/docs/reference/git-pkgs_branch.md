---
title: "git-pkgs branch"
description: "Manage tracked branches"
weight: 10
---

Manage tracked branches

Manage which branches are tracked in the git-pkgs database.

By default, git-pkgs tracks the current branch at init time.
Use this command to add additional branches or view tracking status.

```
git-pkgs branch [flags]
```

### Options

```
  -h, --help   help for branch
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
