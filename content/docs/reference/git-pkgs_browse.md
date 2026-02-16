---
title: "git-pkgs browse"
description: "Open installed package source in editor"
weight: 10
---

Open installed package source in editor

Open the source code of an installed package in your editor.

Detects the package manager from lockfiles in the current directory,
finds where the package is installed, and opens it in $EDITOR.

Examples:
  git-pkgs browse lodash           # open in $EDITOR
  git-pkgs browse lodash --path    # just print the path
  git-pkgs browse lodash --open    # open in file browser
  git-pkgs browse lodash -e npm    # specify ecosystem
  git-pkgs browse serde -m cargo   # specify manager

```
git-pkgs browse <package> [flags]
```

### Options

```
  -e, --ecosystem string   Filter to specific ecosystem
  -h, --help               help for browse
  -m, --manager string     Override detected package manager
      --open               Open in file browser instead of editor
      --path               Print path instead of opening editor
  -t, --timeout duration   Timeout for path lookup (default 30s)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
