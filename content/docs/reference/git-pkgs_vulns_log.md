---
title: "git-pkgs vulns log"
description: "Show commits that changed vulnerability state"
weight: 10
---

Show commits that changed vulnerability state

List commits that introduced or fixed vulnerabilities.
Shows a timeline of how vulnerabilities have changed over time.

```
git-pkgs vulns log [flags]
```

### Options

```
      --author string      Filter by author name or email
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
      --fixed              Only show commits that fixed vulnerabilities
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for log
      --introduced         Only show commits that introduced vulnerabilities
      --limit int          Maximum commits to check (default 20)
  -s, --severity string    Minimum severity: critical, high, medium, low
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
