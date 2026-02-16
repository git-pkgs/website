---
title: "git-pkgs stats"
description: "Show dependency statistics"
weight: 10
---

Show dependency statistics

Display aggregate statistics about dependencies and changes.

```
git-pkgs stats [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
      --by-author          Show detailed per-author statistics
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for stats
  -n, --limit int          Number of top items to show (default 10)
      --since string       Only changes after this date (YYYY-MM-DD)
      --until string       Only changes before this date (YYYY-MM-DD)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
