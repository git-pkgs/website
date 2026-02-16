---
title: "git-pkgs notes"
description: "Manage notes on packages"
weight: 10
---

Manage notes on packages

Attach arbitrary metadata and messages to packages identified by PURL.

Notes are keyed on (purl, namespace) pairs. A namespace lets you categorize
notes (e.g. "security", "audit", "review"). The default namespace is empty.

### Options

```
  -h, --help   help for notes
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
