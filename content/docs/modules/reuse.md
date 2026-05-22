---
title: reuse
---

A Go library for parsing REUSE-compliant projects (spec v3.3). Extracts SPDX license and copyright information from file headers, `.license` sidecars, `REUSE.toml` annotations, and `.reuse/dep5` files.

```go
import "github.com/git-pkgs/reuse"

p, err := reuse.OpenProject("/path/to/repo")

info, err := p.ReuseInfoOf("src/main.go")
fmt.Println(info.LicenseExpressions) // ["MIT"]
fmt.Println(info.CopyrightNotices)   // ["2024 Jane Doe <jane@example.com>"]

all, err := p.AllReuseInfo()
for path, info := range all {
    fmt.Printf("%s: %v\n", path, info.LicenseExpressions)
}
```

SPDX expressions are stored as raw strings; validation is left to the caller (see [spdx](../spdx/) if you need it).

## Standalone parsers

Each REUSE source can also be parsed on its own.

```go
// SPDX tags from text
info := reuse.ExtractReuseInfo(`// SPDX-License-Identifier: MIT OR Apache-2.0
// SPDX-FileCopyrightText: 2024 Alice`)

// REUSE.toml
rt, err := reuse.ParseReuseTOMLFile("REUSE.toml")
info, precedence, ok := rt.ReuseInfoOf("src/main.go")
// precedence is "closest", "aggregate", or "override"

// .reuse/dep5
d, err := reuse.ParseDep5File(".reuse/dep5")
info, ok := d.ReuseInfoOf("docs/guide.md")
```

## Installation

```bash
go get github.com/git-pkgs/reuse
```

[View on GitHub](https://github.com/git-pkgs/reuse)
