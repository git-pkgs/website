---
title: "git-pkgs reindex"
description: "Update database with new commits"
weight: 10
---

Update database with new commits

Incrementally update the git-pkgs database with commits since
the last analysis. Use this after pulling new changes.

```
git-pkgs reindex [flags]
```

### Options

```
  -b, --branch string   Branch to reindex (default: tracked branch)
  -h, --help            help for reindex
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
