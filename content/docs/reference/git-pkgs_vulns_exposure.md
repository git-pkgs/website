---
title: "git-pkgs vulns exposure"
description: "Calculate vulnerability exposure time"
weight: 10
---

Calculate vulnerability exposure time

Calculate how long each current vulnerability has been present in the codebase.
Shows the exposure time from when the vulnerable package was first added.

```
git-pkgs vulns exposure [flags]
```

### Options

```
      --all-time           Include historical vulnerabilities that have been fixed
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for exposure
  -r, --ref string         Check exposure at specific commit (default: HEAD)
  -s, --severity string    Minimum severity: critical, high, medium, low
      --summary            Show aggregate metrics only
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
