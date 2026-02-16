---
title: "git-pkgs integrity"
description: "Show lockfile integrity hashes"
weight: 10
---

Show lockfile integrity hashes

Display integrity hashes for lockfile dependencies and detect
drift where the same version has different hashes across manifests.

```
git-pkgs integrity [flags]
```

### Options

```
  -b, --branch string      Branch to query (default: current branch)
  -c, --commit string      Check integrity at specific commit (default: HEAD)
      --drift              Only show packages with integrity drift
  -e, --ecosystem string   Filter by ecosystem
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for integrity
      --registry           Check integrity against package registry
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
