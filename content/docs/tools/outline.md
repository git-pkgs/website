---
title: outline
---

Reduces a source tree to a structural skeleton suitable for feeding to an LLM. Function and method bodies are dropped; signatures, types, comments, and imports are kept. Unsupported file types pass through unchanged.

```go
import "github.com/git-pkgs/outline"

r, err := outline.Pack(".", outline.Options{Compress: true})
if err != nil {
    return err
}
r.Markdown(os.Stdout)
```

A Go function like

```go
func SayHello(name string) {
    fmt.Printf("Hello, %s!\n", name)
}
```

becomes

```
func SayHello(name string) {
⋮----
```

`Pack(root, opts)` walks the tree, applies `.gitignore` plus a built-in ignore list (vendored deps, build output, lockfiles), skips binaries and oversized files, and outlines what it can. `Outline(src, filename)` compresses a single file. `Result.Markdown(w)` and `Result.XML(w)` write the packed document.

This is roughly the `--compress` core of [repomix](https://github.com/yamadashy/repomix) reimplemented in Go. On the same inputs it produces equivalent declaration coverage, preserves indentation (repomix strips it), and avoids a few cases where repomix leaks function bodies in Ruby and Python. It does not do token counting, secret scanning, or remote cloning.

## Languages

35 languages have body-stripping queries: Go, Ruby, Python, JavaScript, TypeScript/TSX, Rust, Java, C, C++, C#, PHP, Kotlin, Swift, Scala, Dart, Elixir, Erlang, Haskell, Clojure, Perl, Lua, R, Julia, OCaml, F#, Crystal, Nim, Zig, D, Groovy, HCL/Terraform, Starlark/Bazel, CMake, Bash, Make. Pure Go via gotreesitter, no CGo. Adding a language means writing one `.scm` query file.

## Installation

```bash
go get github.com/git-pkgs/outline
```

[View on GitHub](https://github.com/git-pkgs/outline)
