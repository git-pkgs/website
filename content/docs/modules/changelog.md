---
title: changelog
---

A Go library for parsing changelog files into structured version entries. Detects format automatically and handles Keep a Changelog, markdown headers, and setext/underline styles.

```go
import "github.com/git-pkgs/changelog"

p := changelog.Parse(content)
for _, v := range p.Versions() {
    entry, _ := p.Entry(v)
    fmt.Printf("%s: %s\n", v, entry.Content)
    if entry.Date != nil {
        fmt.Printf("  Released: %s\n", entry.Date.Format("2006-01-02"))
    }
}
```

## Parsing files

```go
// Parse a specific file
p, err := changelog.ParseFile("CHANGELOG.md")

// Find and parse a changelog in a directory
// Looks for CHANGELOG.md, NEWS, CHANGES, HISTORY, etc.
p, err := changelog.FindAndParse(".")
```

## Getting content between versions

```go
// Get everything between two version headers
content, ok := p.Between("1.0.0", "2.0.0")
```

## Supported formats

| Format | Example |
|--------|---------|
| Keep a Changelog | `## [1.0.0] - 2024-01-15` |
| Markdown headers | `## 1.0.0 (2024-01-15)` |
| Setext/underline | `1.0.0` followed by `=====` |

Custom patterns are also supported via `ParseWithPattern`.

## Installation

```bash
go get github.com/git-pkgs/changelog
```

[View on GitHub](https://github.com/git-pkgs/changelog)
