---
title: brief
---

A single-binary CLI that detects a software project's toolchain, configuration, and conventions, then outputs a structured report. It answers the bootstrap questions every AI coding agent, new contributor, and CI pipeline faces: what language is this, how do I install dependencies, how do I run the tests, what linter is configured. It does not score, grade, or judge.

```
brief [path | url]      Detect project toolchain
brief diff [ref] [ref]  Detect only what changed between refs
brief missing           Recommended tooling gaps
brief threat-model      Threat categories implied by detected stack
brief sinks             Dangerous functions in detected tools
brief enrich            Detect and enrich with external data
brief list tools        All tools in the knowledge base
```

Works on local paths, git URLs, and registry packages (`brief npm:express`, `brief gem:rails`). JSON when piped, human-readable on a TTY.

```
brief dev — /home/user/myproject

Language:        Go
Package Manager: Go Modules (go mod download)
                 Lockfile: go.sum
                 9 runtime (223 total)

Test:        go test (go test ./...)
Lint:        golangci-lint (golangci-lint run)  [.golangci.yml]
Format:      gofmt (gofmt -w .)
Build:       GoReleaser (goreleaser release --clean)  [.goreleaser.yaml]
Security:    govulncheck (govulncheck ./...)
CI:          GitHub Actions  [.github/workflows/]

Style:       tabs (inferred)  LF
Resources:   README.md  LICENSE (MIT)
Git:         branch main  71 commits

148.7ms  428 files checked  11/355 tools matched
```

`brief diff` runs the same detection but filters to tools relevant to changed files, which is the useful form on a feature branch. `brief missing` suggests the canonical tool for each absent category. `brief threat-model` and `brief sinks` map the detected stack to CWE/OWASP categories and known dangerous functions, both purely from lookup tables with no heuristics.

## Use with AI coding agents

Add this to your `CLAUDE.md`, `agents.md`, or equivalent:

```
Before starting work on this project, run `brief .` to understand the toolchain,
test commands, linters, and project conventions. If on a branch, also run
`brief diff` to see which parts of the toolchain are affected by your changes.
```

To let Claude Code run it without prompting, add `"Bash(brief *)"` to `permissions.allow` in `~/.claude/settings.json`.

## How it works

Detection rules are data, not code. Each tool is a TOML file under `knowledge/`, organised by ecosystem, with file/dependency/content matchers, taxonomy tags from [oss-taxonomy](https://github.com/ecosyste-ms/oss-taxonomy), and optional security sink definitions. Adding a tool is one TOML file with no Go changes. The knowledge base currently covers 54 language ecosystems and 516 tool definitions across 20 categories.

The detection engine, knowledge base, and reporters are also importable Go packages:

```go
import (
    "github.com/git-pkgs/brief"
    "github.com/git-pkgs/brief/kb"
    "github.com/git-pkgs/brief/detect"
)

knowledgeBase, _ := kb.Load(brief.KnowledgeFS)
r, _ := detect.New(knowledgeBase, "/path/to/project").Run()
```

## Installation

```bash
brew install git-pkgs/git-pkgs/brief
# or
go install github.com/git-pkgs/brief/cmd/brief@latest
```

[View on GitHub](https://github.com/git-pkgs/brief)
