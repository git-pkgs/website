---
title: "git-pkgs bisect skip"
description: "Skip commits that can't be tested"
weight: 10
---

Skip commits that can't be tested

Skip one or more commits that cannot be tested (e.g., won't build).

```
git-pkgs bisect skip [<rev>...] [flags]
```

### Options

```
  -h, --help   help for skip
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
