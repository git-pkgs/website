---
title: "git-pkgs bisect start"
description: "Start a bisect session"
weight: 10
---

Start a bisect session

Begin a new bisect session. Optionally specify the bad (newer) and good (older)
commits on the command line.

Filtering options narrow which commits are considered:
  --ecosystem  Only commits changing dependencies in this ecosystem
  --package    Only commits touching this specific package
  --manifest   Only commits changing this manifest file

```
git-pkgs bisect start [<bad> [<good>...]] [flags]
```

### Options

```
  -e, --ecosystem string   Only consider commits changing this ecosystem
  -h, --help               help for start
      --manifest string    Only consider commits changing this manifest
      --package string     Only consider commits touching this package
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
