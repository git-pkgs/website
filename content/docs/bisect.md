---
title: Bisect
weight: 40
---

`git pkgs bisect` finds when a dependency-related change was introduced using binary search. It works like `git bisect` but only considers commits that modified dependencies, making searches faster when the problem is dependency-related.

If you have 1000 commits between good and bad but only 15 changed dependencies, you're searching 15 commits instead of 1000.

## Basic usage

Start a bisect session:

```bash
git pkgs bisect start
git pkgs bisect bad              # current commit has the problem
git pkgs bisect good v1.0.0      # this version was fine
```

If the commits aren't indexed yet, git-pkgs automatically runs an incremental reindex before proceeding.

git-pkgs checks out a commit in the middle (only considering commits with dependency changes):

```
Bisecting: 12 dependency changes left to test (roughly 4 steps)
[abc1234] Add monitoring dependencies
```

Test and mark:

```bash
git pkgs bisect good    # or bad, depending on your test
```

Repeat until git-pkgs identifies the culprit:

```
321hijk is the first bad commit

commit 321hijk
Author: Jane <jane@example.com>
Date:   Fri Mar 15 10:30:00 2024

    Add tracking pixel for marketing

Dependencies changed:
  + tracking-pixel@1.0.0
  + pixel-utils@0.2.1
```

Author attribution respects `.mailmap` if present in your repository.

End the session:

```bash
git pkgs bisect reset
```

## Automated bisect

The `run` subcommand automates bisecting with a script. Exit codes: 0 = good, 1-124 = bad, 125 = skip.

```bash
git pkgs bisect start HEAD v1.0.0
git pkgs bisect run ./test-dependencies.sh
```

## Use cases

Find when dependencies gained network capabilities (using [capslock](https://github.com/google/capslock)):

```bash
git pkgs bisect start HEAD v1.0.0
git pkgs bisect run sh -c 'go mod tidy && capslock -packages ./... 2>/dev/null | grep -q NETWORK && exit 1 || exit 0'
```

Find when a vulnerability was introduced:

```bash
git pkgs bisect start HEAD v1.0.0
git pkgs bisect run sh -c 'git pkgs vulns 2>/dev/null | grep -q CVE-2024-1234 && exit 1 || exit 0'
```

Find when a copyleft license appeared:

```bash
git pkgs bisect start HEAD v1.0.0
git pkgs bisect run sh -c 'git pkgs licenses --allow=MIT,Apache-2.0,BSD-2-Clause,BSD-3-Clause >/dev/null 2>&1'
```

Find when tests started failing due to a dependency:

```bash
git pkgs bisect start HEAD v1.0.0
git pkgs bisect run npm test
```

## Filtering

Narrow the search to specific ecosystems, packages, or manifests:

```bash
git pkgs bisect start --ecosystem=npm HEAD v1.0.0
git pkgs bisect start --package=lodash HEAD v1.0.0
git pkgs bisect start --manifest=packages/frontend/package.json HEAD v1.0.0
```

## How it differs from git bisect

`git pkgs bisect` only considers commits where dependencies changed. For general bisecting use `git bisect`. For dependency-specific problems, `git pkgs bisect` gets you there faster.

| Feature | git bisect | git pkgs bisect |
|---------|------------|-----------------|
| Searches all commits | Yes | No |
| Searches dependency changes only | No | Yes |
| Filtering by ecosystem/package | No | Yes |
