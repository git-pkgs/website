---
title: Querying Dependencies
weight: 25
---

Beyond the basic commands in [Getting Started](/docs/getting-started), git-pkgs provides additional ways to explore your dependency data.

## Search

Find dependencies matching a pattern:

```bash
git pkgs search react           # find packages containing "react"
git pkgs search aws -e npm      # filter by ecosystem
git pkgs search test --direct   # only direct dependencies (exclude lockfile)
git pkgs search lodash -f json  # JSON output
```

Results include when each package was first added and last changed.

## Log

List commits that changed dependencies, like `git log` but filtered to dependency changes:

```bash
git pkgs log                    # recent commits with dependency changes
git pkgs log -n 50              # show more commits
git pkgs log --author=alice     # filter by author
git pkgs log --since=2024-01-01 # commits after date
git pkgs log -e npm             # filter by ecosystem
```

Each commit shows a summary of changes: packages added, modified, and removed.

## Tree

Display dependencies grouped by manifest and dependency type:

```bash
git pkgs tree                   # show dependency tree
git pkgs tree -e rubygems       # filter by ecosystem
git pkgs tree --commit=v1.0.0   # at a specific commit
git pkgs tree -f json           # JSON output
```

Output shows the hierarchy:

```
Gemfile (rubygems)
├── runtime
│   ├── rails 7.0.0
│   ├── sidekiq 6.0.0
│   └── puma 5.0.0
└── development
    ├── rspec 3.12.0
    └── factory_bot 6.2.0
```

## Where

Find where a package is declared in your manifest files:

```bash
git pkgs where rails            # find in all manifests
git pkgs where lodash -e npm    # filter by ecosystem
git pkgs where express -C 2     # show 2 lines of context
git pkgs where react -f json    # JSON output
```

Output shows file path, line number, and content:

```
Gemfile:5:gem "rails", "~> 7.0"
Gemfile.lock:142:    rails (7.0.8)
```

Like grep but scoped to manifest files that git-pkgs recognizes.
