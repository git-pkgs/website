---
title: "git-pkgs health"
description: "Show dependency maintenance health scores"
weight: 10
---

Show dependency maintenance health scores

Score dependency maintenance health using cached package metadata from ecosyste.ms.

```
git-pkgs health [flags]
```

### Options

```
      --all                Include transitive dependencies from lockfiles
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for health
      --threshold int      Only show dependencies with health scores at or below this threshold; at-risk count uses the same threshold (default 100)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
