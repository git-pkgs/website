---
title: "git-pkgs vulns praise"
description: "Show who fixed vulnerabilities"
weight: 10
---

Show who fixed vulnerabilities

Attribute vulnerability fixes to the developers who resolved them.
This is the opposite of blame - it shows positive contributions to security.

```
git-pkgs vulns praise [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for praise
      --limit int          Maximum commits to check (default 50)
  -s, --severity string    Minimum severity: critical, high, medium, low
      --summary            Show author leaderboard only
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
