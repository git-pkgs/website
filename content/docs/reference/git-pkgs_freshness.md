---
title: "git-pkgs freshness"
description: "Show release freshness metrics"
weight: 10
---

Show release freshness metrics

Compare installed dependency versions with the latest published versions.
Reports how many days dependencies lag behind latest releases and lists the
packages with the largest release-date lag.

```
git-pkgs freshness [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for freshness
  -n, --limit int          Number of lagging dependencies to show (default 10)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
