---
title: "git-pkgs vulns scan"
description: "Scan dependencies for vulnerabilities"
weight: 10
---

Scan dependencies for vulnerabilities

Check all dependencies against the OSV database for known vulnerabilities.
Results are grouped by severity.

By default, syncs vulnerability data from OSV before scanning. The sync uses a
24-hour cache so repeated scans won't re-fetch everything.
Use --live to query OSV directly for each dependency version.
Use --no-sync to skip the sync and use only previously cached data.

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
      --no-sync            Skip auto-sync and use only cached vulnerability data
  -s, --severity string    Minimum severity to report: critical, high, medium, low
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
