---
title: skills
---

A [Claude Code plugin](https://code.claude.com/docs/en/plugins) providing dependency management skills powered by git-pkgs and [brief](../brief/).

```
/plugin marketplace add git-pkgs/skills
/plugin install git-pkgs@git-pkgs
```

Requires `git-pkgs` and `brief` on `$PATH`.

| Skill | Description |
|-------|-------------|
| `brief` | Detect project toolchain, languages, package managers, test runners, linters |
| `init` | Initialise, reindex, or manage the git-pkgs database |
| `list` | List, search, and locate dependencies |
| `diff` | Compare dependencies between commits, branches, or working tree |
| `history` | Track dependency change history, blame, bisect |
| `audit` | Scan for known vulnerabilities via OSV |
| `outdated` | Find outdated or stale dependencies |
| `licenses` | License compliance checking |
| `sbom` | Generate CycloneDX or SPDX SBOMs |
| `manage` | Add, remove, update, install, or vendor dependencies |
| `evaluate` | Assess a package's trustworthiness before adding it |

Most skills are triggered automatically when relevant; `manage` is manual-only since it modifies dependencies. Invoke directly with `/git-pkgs:audit` or `/git-pkgs:evaluate lodash`, or just ask in plain English and Claude picks the right one.

[View on GitHub](https://github.com/git-pkgs/skills)
