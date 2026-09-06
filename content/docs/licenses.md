---
title: Licenses
weight: 22
---

Check the licenses of your dependencies and enforce compliance policies.

## Basic usage

```bash
git pkgs licenses               # show license for each dependency
git pkgs licenses --group       # group output by license
```

## Compliance checking

Flag copyleft licenses:

```bash
git pkgs licenses --copyleft
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
      - uses: actions/checkout@v7
        with:
          fetch-depth: 0

      - uses: git-pkgs/actions/setup@v1

      - name: Check licenses
        run: git-pkgs licenses --allow=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause,ISC
```

## Options

```
    --allow=LIST         Only allow these SPDX identifiers (exit 1 on violation)
    --deny=LIST          Deny these SPDX identifiers (exit 1 if found)
    --permissive         Flag non-permissive licenses
    --copyleft           Flag copyleft licenses (GPL, AGPL)
    --unknown            Flag packages with unknown licenses
    --drift              Flag dependencies whose license changed between installed and latest
    --group              Group output by license instead of by package
    --dependencies=KIND  Dependencies to include: direct, indirect, all (default direct)
    --license-text       Include license and notice text from package artifacts (JSON only)
    --offline            Use cached metadata without making network requests
-b, --branch=NAME        Branch to query (default: current branch)
-c, --commit=SHA         Check licenses at a specific commit (default: HEAD)
-e, --ecosystem=NAME     Filter by ecosystem
-f, --format=FORMAT      Output format: text, json, csv
```

## Data source

License identifiers are fetched from package registries via [ecosyste.ms](https://packages.ecosyste.ms/) and cached locally. With `--license-text --format json` the command additionally downloads each dependency's published artifact into a local cache and scans it with the [licenses](../modules/licenses/) matcher, adding the extracted license and notice text and any detected SPDX expressions to the JSON output. Artifact scanning needs a resolved version per dependency, so a lockfile must be present; `--offline` restricts both lookups to what is already cached.
