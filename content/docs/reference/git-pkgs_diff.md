---
title: "git-pkgs diff"
description: "Compare dependencies between commits or working tree"
weight: 10
---

Compare dependencies between commits or working tree

Compare dependencies between two commits, refs, or the working tree.
With no arguments, compares HEAD against the working tree (like git diff).
Supports range syntax (main..feature) or explicit --from/--to flags.

```
git-pkgs diff [from..to] [flags]
```

### Options

```
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
      --from string        Starting commit (default: HEAD)
  -h, --help               help for diff
      --to string          Ending commit (default: working tree)
  -t, --type string        Filter by dependency type (runtime, development, etc.)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
