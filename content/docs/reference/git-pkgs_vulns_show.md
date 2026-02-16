---
title: "git-pkgs vulns show"
description: "Show details of a vulnerability"
weight: 10
---

Show details of a vulnerability

Display detailed information about a specific vulnerability by its ID.
With --ref, also shows exposure analysis for this vulnerability in the repo.

```
git-pkgs vulns show <vuln-id> [flags]
```

### Options

```
  -b, --branch string   Branch to query for exposure analysis
  -f, --format string   Output format: text, json (default "text")
  -h, --help            help for show
  -r, --ref string      Analyze exposure at specific commit (shows repo impact)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
