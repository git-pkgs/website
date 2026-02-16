---
title: "git-pkgs vulns scan"
description: "Scan dependencies for vulnerabilities"
weight: 10
---

Scan dependencies for vulnerabilities

Check all dependencies against the OSV database for known vulnerabilities.
Results are grouped by severity.

By default, uses cached vulnerability data from the database if available.
Use --live to always query OSV directly.

```
git-pkgs vulns scan [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Scan dependencies at specific commit (default: HEAD)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json, sarif (default "text")
  -h, --help               help for scan
      --live               Query OSV directly instead of using cached data
  -s, --severity string    Minimum severity to report: critical, high, medium, low
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
