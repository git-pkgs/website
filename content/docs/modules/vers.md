---
title: vers
---

A Go implementation of the [VERS specification](https://github.com/package-url/purl-spec/blob/main/VERSION-RANGE-SPEC.rst) for version range parsing and comparison across package ecosystems.

```go
import "github.com/git-pkgs/vers"

// Parse VERS URIs
r, _ := vers.Parse("vers:npm/>=1.0.0|<2.0.0")
fmt.Println(r.Contains("1.5.0"))  // true
fmt.Println(r.Contains("2.0.0"))  // false

// Parse native package manager syntax
r, _ := vers.ParseNative("^1.2.3", "npm")
r, _ = vers.ParseNative("~> 1.2", "gem")
r, _ = vers.ParseNative("~=1.4.2", "pypi")
r, _ = vers.ParseNative("[1.0,2.0)", "maven")

// Check version satisfaction
ok, _ := vers.Satisfies("1.5.0", "^1.0.0", "npm")
fmt.Println(ok)  // true

// Compare versions
vers.Compare("1.2.3", "1.2.4")  // -1 (a < b)
vers.Compare("2.0.0", "1.9.9")  // 1  (a > b)

// Version validation and normalization
vers.Valid("1.2.3")        // true
v, _ := vers.Normalize("1.2")  // "1.2.0"

// Combine ranges
r1, _ := vers.ParseNative(">=1.0.0", "npm")
r2, _ := vers.ParseNative("<2.0.0", "npm")
intersection := r1.Intersect(r2)  // >=1.0.0 AND <2.0.0

// Convert to VERS URI
uri := vers.ToVersString(r, "npm")
// vers:npm/>=1.2.3|<2.0.0
```

## Supported ecosystems

| Ecosystem | Example Syntax |
|-----------|----------------|
| npm | `^1.2.3`, `~1.2.3`, `>=1.0.0 <2.0.0`, `1.x` |
| RubyGems | `~> 1.2`, `>= 1.0, < 2.0` |
| PyPI | `~=1.4.2`, `>=1.0.0,<2.0.0`, `!=1.5.0` |
| Maven | `[1.0,2.0)`, `(1.0,2.0]`, `[1.0,)` |
| Cargo | Same as npm |
| Go | `>=1.0.0,<2.0.0` |
| Debian | `>> 1.0`, `<< 2.0` |

## Installation

```bash
go get github.com/git-pkgs/vers
```

[View on GitHub](https://github.com/git-pkgs/vers)
