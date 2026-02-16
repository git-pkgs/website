---
title: "git-pkgs vulns blame"
description: "Show who introduced current vulnerabilities"
weight: 10
---

Show who introduced current vulnerabilities

Attribute current vulnerabilities to the commits that introduced the vulnerable packages.
Shows which developers added packages that are currently vulnerable.

```
git-pkgs vulns blame [flags]
```

### Options

```
      --all-time           Include historical vulnerabilities that have been fixed
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for blame
  -s, --severity string    Minimum severity: critical, high, medium, low
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
