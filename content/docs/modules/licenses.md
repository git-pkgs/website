---
title: licenses
---

Go library for matching license text and scanning repositories against ScanCode's license rule corpus. The corpus is embedded in the package; matching needs no network access, cgo, or Python.

Matching uses normalized whole-text hashes, exact token sequences, and `SPDX-License-Identifier` tag lines. There is no fuzzy or sequence matching, so edits inside a license text can prevent a match.

```go
import "github.com/git-pkgs/licenses"

matcher, err := licenses.New()
if err != nil {
    return err
}

result, err := matcher.Match(ctx, text)
if err != nil {
    return err
}

for _, d := range result.Detections {
    fmt.Println(d.Expression, d.Identification)
}
```

`Match` returns a `Result` with conclusive `Detections` grouped by SPDX expression, weaker `Clues`, and any parsed `SPDXDeclarations` from tag lines. Each match reports the ScanCode rule ID, kind, method (`hash`, `exact`, or `spdx-id`), score, and byte range. Pass `licenses.WithMatchedText()` to `New` to include the matched bytes on each result. The corpus is loaded once per process and shared by every `Matcher`.

Expressions use canonical SPDX identifiers where ScanCode supplies one and `LicenseRef-scancode-<key>` otherwise. `Identification` is `identified`, `partial`, or SPDX's `NOASSERTION` depending on whether the expression names concrete licenses or ScanCode placeholders. Tag expression grammar is parsed with [spdx](../spdx/).

## Repository scanning

```go
options := licenses.DefaultScanOptions()
options.IncludeLegalFiles = true

report, err := licenses.ScanRepository(ctx, matcher, ".", options)
if err != nil {
    return err
}

for _, file := range report.Files {
    fmt.Println(file.Path, file.Roles, file.LicenseTextCoverage)
}
```

`ScanRepository` walks a tree with the same limits as the [CLI](../../tools/licenses/): configurable depth, file count, per-file size, worker count, and skip list. `NoDefaultSkip` includes hidden, dependency, build, cache, and test-data directories for a `-scope all` style scan. `IncludeLegalFiles` retains recognised `LICENSE`, `COPYING`, and `NOTICE` files even when the corpus produces no match, with their full text decoded to UTF-8.

The returned `ScanReport` contains per-file detections and clues, aggregate expression counts, `Declared` records from recognised package manifests (raw values plus a normalised SPDX expression), skip and error records, and a summary.

## Installation

```bash
go get github.com/git-pkgs/licenses
```

[View on GitHub](https://github.com/git-pkgs/licenses)
