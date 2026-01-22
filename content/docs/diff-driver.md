---
title: Diff Driver
weight: 45
---

`git pkgs diff-driver` installs a git textconv driver that transforms lockfile diffs into readable dependency changes. Instead of cryptic lockfile syntax, you see what actually changed: which packages were added, removed, or updated.

## Installation

```bash
git pkgs diff-driver --install
```

This configures git to use git-pkgs for lockfile diffs in the current repository.

## Usage

Once installed, `git diff` on lockfiles shows semantic changes:

```diff
+ kamal 2.0.0
- puma 5.6.8
+ puma 6.4.2
+ thruster 0.1.0
```

This works with `git diff`, `git show`, `git log -p`, and anywhere git displays diffs. Pull request reviews become easier when you can see actual dependency changes rather than lockfile churn.

## Viewing raw diffs

To bypass the driver and see the original lockfile format:

```bash
git diff --no-textconv
```

## Uninstalling

```bash
git pkgs diff-driver --uninstall
```
