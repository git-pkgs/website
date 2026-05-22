---
title: resolve
---

A Go library for parsing raw package manager CLI output into a normalised dependency graph with PURLs. Takes the bytes from a manager's resolve command (`npm ls --json`, `go mod graph`, `uv tree`) and returns a tree of `Dep` structs.

```go
import (
    "github.com/git-pkgs/resolve"
    _ "github.com/git-pkgs/resolve/parsers" // register all parsers
)

output, _ := exec.Command("npm", "ls", "--depth", "Infinity", "--json", "--long").Output()

result, err := resolve.Parse("npm", output)
// result.Manager   == "npm"
// result.Ecosystem == "npm"
// result.Direct    == []*Dep{ {PURL: "pkg:npm/express@4.18.2", Name: "express", ...}, ... }
```

`Parse` is the only entry point. It dispatches on the manager name and returns `ErrUnsupportedManager` for unknown ones. Each `Dep` carries the native package name, resolved version, PURL string, and a `Deps` slice for transitives. `Deps` is nil for managers that only emit flat lists (pip, conda, bundler, helm).

This pairs with the `resolve` operation in [managers](../managers/): managers builds the right command for an ecosystem, resolve parses what comes back.

## Supported managers

| Manager | Ecosystem | Output format |
|---------|-----------|---------------|
| npm | npm | JSON tree |
| pnpm | npm | JSON tree |
| yarn | npm | NDJSON tree |
| bun | npm | Text tree |
| cargo | cargo | JSON graph |
| gomod | golang | Edge list |
| pip | pypi | JSON flat |
| uv | pypi | Text tree |
| poetry | pypi | Text tree |
| conda | conda | JSON flat |
| bundler | gem | Text flat |
| maven | maven | Text tree |
| gradle | maven | Text tree |
| composer | packagist | Text tree |
| nuget | nuget | Tabular |
| swift | swift | JSON tree |
| pub | pub | Text tree |
| mix | hex | Text tree |
| rebar3 | hex | Text tree |
| stack | hackage | JSON flat |
| lein | clojars | Text tree |
| conan | conan | Custom |
| deno | deno | JSON flat |
| helm | helm | Tabular |

## Installation

```bash
go get github.com/git-pkgs/resolve
```

[View on GitHub](https://github.com/git-pkgs/resolve)
