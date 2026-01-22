---
title: Licenses
weight: 22
---

Check the licenses of your dependencies and enforce compliance policies.

## Basic usage

```bash
git pkgs licenses               # show license for each dependency
git pkgs licenses --group       # group output by license
git pkgs licenses --stateless   # no database needed
```

## Compliance checking

Flag copyleft licenses:

```bash
git pkgs licenses --permissive
```

Use an explicit allow list:

```bash
git pkgs licenses --allow=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC
```

The command exits with code 1 if any dependency has a license not in the allow list, making it suitable for CI.

## CI example

```yaml
name: License Check
on: pull_request

jobs:
  licenses:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install git-pkgs
        run: |
          curl -sL https://github.com/git-pkgs/git-pkgs/releases/latest/download/git-pkgs-linux-amd64 -o git-pkgs
          chmod +x git-pkgs

      - name: Check licenses
        run: ./git-pkgs licenses --stateless --allow=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC
```

## Options

```
    --allow=LIST        Comma-separated list of allowed SPDX identifiers
    --permissive        Flag copyleft licenses (GPL, AGPL, etc.)
    --group             Group output by license instead of by package
-e, --ecosystem=NAME    Filter by ecosystem
-f, --format=FORMAT     Output format (text, json)
    --stateless         Parse manifests directly without database
```

## Data source

License information is fetched from package registries via [ecosyste.ms](https://packages.ecosyste.ms/). Results are cached locally.
