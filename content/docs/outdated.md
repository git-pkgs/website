---
title: Outdated
weight: 24
---

Find dependencies with newer versions available.

## Basic usage

```bash
git pkgs outdated               # all outdated packages
git pkgs outdated --major       # only major version updates
git pkgs outdated --minor       # minor and major (skip patch)
```

Major updates are shown in red, minor in yellow, patch in cyan.

## Time travel

The `--at` flag shows what was outdated at a point in time:

```bash
git pkgs outdated --at v2.0.0        # what was outdated when we released v2.0?
git pkgs outdated --at 2024-03-01    # what was outdated on this date?
git pkgs outdated --at HEAD~50       # what was outdated 50 commits ago?
```

When given a git ref (tag, branch, commit SHA), it uses the commit's date to determine what versions were available at that time.

## Workflow

```bash
git pkgs outdated            # see what needs updating
git pkgs update              # update all
git pkgs update lodash       # or update specific package
git pkgs vulns               # check for new vulnerabilities
git pkgs diff HEAD           # review changes
```

## Options

```
    --major             Only show major version updates
    --minor             Show minor and major (skip patch)
    --at=REF            Show outdated at a point in time (date or git ref)
-e, --ecosystem=NAME    Filter by ecosystem
-f, --format=FORMAT     Output format (text, json)
```

## Data source

Version information is fetched from package registries via [ecosyste.ms](https://packages.ecosyste.ms/). Results are cached locally.
