---
title: "git-pkgs tree"
description: "Display dependencies as a tree"
weight: 10
---

Display dependencies as a tree

Show dependencies grouped by manifest and dependency type.

```
git-pkgs tree [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
      --commit string      Commit to show dependencies at (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for tree
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
