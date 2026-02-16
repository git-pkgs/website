---
title: "git-pkgs vulns diff"
description: "Compare vulnerabilities between commits"
weight: 10
---

Compare vulnerabilities between commits

Show vulnerabilities that were added or fixed between two commits.
Defaults to comparing HEAD~1 with HEAD.

```
git-pkgs vulns diff [from] [to] [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for diff
  -s, --severity string    Minimum severity: critical, high, medium, low
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
