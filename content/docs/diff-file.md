---
title: Diff File
weight: 44
---

`git pkgs diff-file` compares dependencies between two manifest files directly, without a git repository or database. It runs the same diff algorithm as `git pkgs diff` but takes file paths instead of git refs.

## Usage

```bash
git pkgs diff-file [from] [to]
```

Compare two lockfiles:

```bash
git pkgs diff-file Gemfile.lock.old Gemfile.lock
git pkgs diff-file /path/to/project-a/package.json /path/to/project-b/package.json
```

## Options

`--filename` overrides the filename used for manifest type detection. Useful when comparing files with non-standard names:

```bash
git pkgs diff-file before.lock after.lock --filename=Gemfile.lock
```

`-f, --format` sets the output format (`text` or `json`):

```bash
git pkgs diff-file old.lock new.lock -f json
```

## Use cases

Comparing dependencies across different projects, without needing them in the same git repository.

Analyzing archived source code or tarballs where git history isn't available.

Running the diff tool in repositories using other version control systems like jj.
