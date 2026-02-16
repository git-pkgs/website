---
title: "git-pkgs history"
description: "Show history of dependency changes"
weight: 10
---

Show history of dependency changes

Show the history of changes to a specific package, or all packages if none specified.
Changes are shown in chronological order.

```
git-pkgs history [package] [flags]
```

### Options

```
      --author string      Filter by author name or email
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for history
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
