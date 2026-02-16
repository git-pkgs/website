---
title: "git-pkgs vulns history"
description: "Show vulnerability history for a package"
weight: 10
---

Show vulnerability history for a package

Display the vulnerability history for a specific package across all analyzed commits.
Shows when the package was vulnerable and what vulnerabilities affected it.

```
git-pkgs vulns history <package> [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: first tracked branch)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for history
      --limit int          Maximum commits to check (default 50)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
