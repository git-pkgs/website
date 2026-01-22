---
title: managers
---

A Go library that wraps package manager CLIs behind a common interface. Translates generic operations (install, add, remove, update) into the correct commands for each package manager.

```go
import (
    "github.com/git-pkgs/managers"
    "github.com/git-pkgs/managers/definitions"
)

defs, _ := definitions.LoadEmbedded()
translator := managers.NewTranslator()
for _, def := range defs {
    translator.Register(def)
}

// Same operation, different managers
cmd, _ := translator.BuildCommand("npm", "add", managers.CommandInput{
    Args: map[string]string{"package": "lodash"},
    Flags: map[string]any{"dev": true},
})
// Result: ["npm", "install", "lodash", "--save-dev"]

cmd, _ = translator.BuildCommand("bundler", "add", managers.CommandInput{
    Args: map[string]string{"package": "rails"},
    Flags: map[string]any{"dev": true},
})
// Result: ["bundle", "add", "rails", "--group", "development"]
```

## Supported package managers

npm, pnpm, yarn, bun, deno, bundler, gem, cargo, gomod, pip, uv, poetry, conda, composer, mix, rebar3, pub, cocoapods, swift, nuget, maven, gradle, sbt, cabal, stack, opam, luarocks, nimble, shards, cpanm, lein, vcpkg, conan, helm, brew.

## Operations

| Operation | Description |
|-----------|-------------|
| `install` | Install dependencies from lockfile |
| `add` | Add a new dependency |
| `remove` | Remove a dependency |
| `list` | List installed packages |
| `outdated` | Show packages with available updates |
| `update` | Update dependencies |
| `path` | Get filesystem path to installed package |

## Installation

```bash
go get github.com/git-pkgs/managers
```

[View on GitHub](https://github.com/git-pkgs/managers)
