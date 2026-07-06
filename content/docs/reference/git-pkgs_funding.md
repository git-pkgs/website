---
title: "git-pkgs funding"
description: "Show dependency funding information"
weight: 10
---

Show dependency funding information

Check package metadata for funding links and show dependencies that have or need funding information.

```
git-pkgs funding [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for funding
      --missing            Show dependencies without funding links
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
