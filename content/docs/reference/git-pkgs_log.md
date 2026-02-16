---
title: "git-pkgs log"
description: "List commits with dependency changes"
weight: 10
---

List commits with dependency changes

Show commits that modified dependencies, most recent first.

```
git-pkgs log [flags]
```

### Options

```
      --author string      Filter by author name or email
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for log
  -n, --limit int          Maximum number of commits to show (default 20)
      --since string       Only commits after this date (YYYY-MM-DD)
      --until string       Only commits before this date (YYYY-MM-DD)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
