---
title: Database & Configuration
weight: 80
---

git-pkgs stores dependency history in a SQLite database at `.git/pkgs.sqlite3`. These commands help you manage the database and related configuration.

## Info

Show database location, size, and row counts:

```bash
git pkgs info
```

Output:

```
Database Info
========================================

Location: /path/to/repo/.git/pkgs.sqlite3
Size: 8.3 MB

Row Counts
----------------------------------------
  Branches                        1
  Commits                      3988
  Dependency Changes           4732
```

To see which ecosystems are tracked in the database:

```bash
git pkgs info --ecosystems
```

Output:

```
Tracked ecosystems:
  npm (247 dependencies)
  golang (89 dependencies)
```

## Schema

View the database schema:

```bash
git pkgs schema                 # human-readable tables
git pkgs schema -f sql          # CREATE TABLE statements
git pkgs schema -f json         # JSON structure
git pkgs schema -f markdown     # markdown tables
```

Useful for writing custom queries against the database.

## Branches

git-pkgs tracks one branch by default (the one active when you ran `init`). You can add more:

```bash
git pkgs branch                 # list tracked branches
git pkgs branch list            # same as above
git pkgs branch add develop     # track another branch
git pkgs branch remove develop  # stop tracking
```

Adding a branch indexes all its commits. Commits shared between branches are stored once.

## Reindex

Manually update the database (normally handled by git hooks):

```bash
git pkgs reindex
```

Run this if you've disabled hooks or if the database seems out of sync.

## Upgrade

After updating git-pkgs, the database schema may need migration:

```bash
git pkgs upgrade
```

You'll see a message if an upgrade is needed. This rebuilds the database with the new schema.

## Hooks

git-pkgs installs git hooks during `init` to keep the database updated automatically. Manage them with:

```bash
git pkgs hooks                  # show hook status
git pkgs hooks --install        # install hooks
git pkgs hooks --uninstall      # remove hooks
```

The hooks run `git pkgs reindex` after commits, merges, and checkouts.

## Shell Completion

Enable tab completion for commands:

```bash
# Bash
source <(git pkgs completion bash)

# Zsh
git pkgs completion zsh > "${fpath[1]}/_git-pkgs"

# Fish
git pkgs completion fish > ~/.config/fish/completions/git-pkgs.fish

# PowerShell
git pkgs completion powershell | Out-String | Invoke-Expression
```
