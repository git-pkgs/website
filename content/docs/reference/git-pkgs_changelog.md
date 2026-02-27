---
title: "git-pkgs changelog"
description: "Show changelog entries for a package"
weight: 10
---

Show changelog entries for a package

Fetch and display changelog entries for a package between two versions.

Uses the ecosyste.ms API to locate the package's repository and changelog file,
then parses entries between the specified versions.

Examples:
  git-pkgs changelog lodash -e npm --from 4.17.20 --to 4.17.21
  git-pkgs changelog pkg:cargo/serde --from 1.0.0 --to 1.0.200
  git-pkgs changelog express -e npm

```
git-pkgs changelog <package> [flags]
```

### Options

```
  -e, --ecosystem string   Filter by ecosystem
      --from string        Current/old version
  -h, --help               help for changelog
  -m, --manager string     Override package manager (for ecosystem detection)
      --to string          Target/new version (defaults to latest)
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
