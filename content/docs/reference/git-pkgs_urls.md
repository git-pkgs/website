---
title: "git-pkgs urls"
description: "Show registry URLs for a package"
weight: 10
---

Show registry URLs for a package

Display all known URLs for a package: registry page, download, documentation, and PURL.

The package can be specified as a PURL (pkg:cargo/serde@1.0.0) or as a plain
package name. When using a plain name, the database is searched for a matching
dependency and the ecosystem and version are inferred from it.

Examples:
  git-pkgs urls pkg:cargo/serde@1.0.0
  git-pkgs urls lodash --ecosystem npm
  git-pkgs urls pkg:npm/express@4.19.0 --format json

```
git-pkgs urls <package> [flags]
```

### Options

```
  -e, --ecosystem string   Filter/specify ecosystem (used for name lookups)
  -f, --format string      Output format: text, json (default "text")
  -h, --help               help for urls
```

### Options inherited from parent commands

```
      --color string         When to colorize output: auto, always, never (default "auto")
      --include-submodules   Include git submodules when scanning for manifests
  -p, --pager                Use pager for output
  -q, --quiet                Suppress non-essential output
```
