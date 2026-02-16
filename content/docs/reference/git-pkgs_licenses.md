---
title: "git-pkgs licenses"
description: "Show license information for dependencies"
weight: 10
---

Show license information for dependencies

Retrieve license information for all dependencies in the project.
Licenses are normalized to SPDX identifiers when possible.

```
git-pkgs licenses [flags]
```

### Options

```
      --allow strings      Only allow these licenses (exit 1 on violation)
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check licenses at specific commit (default: HEAD)
      --copyleft           Flag copyleft licenses (GPL, AGPL)
      --deny strings       Deny these licenses (exit 1 if found)
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json, csv (default "text")
      --group              Group output by license
  -h, --help               help for licenses
      --permissive         Flag non-permissive licenses
      --unknown            Flag packages with unknown licenses
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
