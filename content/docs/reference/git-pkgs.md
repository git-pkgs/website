---
title: "git-pkgs"
description: "Track package dependencies across git history"
weight: 1
---

Track package dependencies across git history

git-pkgs indexes package dependencies from manifest files across your git history,
enabling you to query what packages were used, when they changed, and identify
potential security vulnerabilities.

### Options

```
      --color string         When to colorize output: auto, always, never (default "auto")
  -h, --help                 help for git-pkgs
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
