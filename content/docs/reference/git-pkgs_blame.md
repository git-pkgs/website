---
title: "git-pkgs blame"
description: "Show who added each dependency"
weight: 10
---

Show who added each dependency

Show the commit and author that first added each current dependency.

```
git-pkgs blame [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for blame
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
