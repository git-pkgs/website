---
title: "git-pkgs search"
description: "Find dependencies matching a pattern"
weight: 10
---

Find dependencies matching a pattern

Search for dependencies whose names match the given pattern.

```
git-pkgs search <pattern> [flags]
```

### Options

```
      --direct             Only show direct dependencies (exclude lockfile)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for search
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
