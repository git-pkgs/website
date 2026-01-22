---
title: Stale
weight: 26
---

Find dependencies that haven't been touched in a long time.

## Basic usage

```bash
git pkgs stale                  # list deps by how long since last changed
git pkgs stale --days=365       # only show deps untouched for a year
git pkgs stale --ecosystem=npm  # filter by ecosystem
```

Shows dependencies sorted by how long since they were last changed in your repo. Useful for finding packages that may have been forgotten or need review.

## Use cases

**Security review**: Dependencies that haven't been updated in years may have unpatched vulnerabilities or be unmaintained upstream.

**Cleanup**: Old dependencies might no longer be needed. If nobody's touched it in two years, maybe it's time to check if it's still used.

**Upgrade planning**: Prioritize updating the stalest dependencies first, as they're most likely to have breaking changes accumulated.

## Options

```
    --days=N            Only show deps untouched for N days
-e, --ecosystem=NAME    Filter by ecosystem
-f, --format=FORMAT     Output format (text, json)
```

## Example output

```
$ git pkgs stale --days=365
Package              Last Changed    Days    Commit
------------------------------------------------------------
left-pad             2019-03-15      1842    abc1234
moment               2020-06-01      1395    def5678
request              2021-01-10      1107    ghi9012
```
