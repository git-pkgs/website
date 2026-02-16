---
title: "git-pkgs diff-driver"
description: "Git textconv driver for lockfile diffs"
weight: 10
---

Git textconv driver for lockfile diffs

A git textconv driver that converts lockfiles to sorted dependency lists.
This makes lockfile diffs more readable by showing semantic changes.

Install with: git pkgs diff-driver --install
Then use 'git diff' normally - lockfiles will show sorted dependency lists.

```
git-pkgs diff-driver [file] [flags]
```

### Options

```
  -h, --help        help for diff-driver
      --install     Install diff driver in git config
      --uninstall   Remove diff driver from git config
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
