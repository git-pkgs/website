---
title: licenses
---

Scan a repository for license text using ScanCode's rule corpus. Matching runs from an embedded, prebuilt index with no network access, cgo, or Python.

The scanner uses whole-file hashes, exact token sequences, and `SPDX-License-Identifier` tag lines. It does not do fuzzy or sequence matching, so edits inside a license text can prevent a match. On a repository like Forgejo (~7 000 files) a scan finishes in about a second.

```
licenses .                                     scan the current directory
licenses -json path/to/repo > licenses.json    write a JSON report
licenses -scope all -max-files 0 path          include vendored dependencies
licenses -version                              print binary and corpus versions
```

JSON output reports each file's detections with rule, expression, kind, method, score, and byte range. Detections carry `identification` set to `identified`, `partial`, or `NOASSERTION` depending on whether the expression names concrete licenses or ScanCode placeholders. Exit status 0 means detections were found, 2 means the scan was incomplete, 3 means no conclusive detections.

## Library

```go
matcher, err := licenses.New()
if err != nil {
    return err
}
result, err := matcher.Match(ctx, text)
```

The corpus is loaded once per process and shared by every `Matcher`.

## Installation

```bash
brew tap git-pkgs/git-pkgs
brew trust --tap git-pkgs/git-pkgs
brew install licenses
```

or

```bash
go install github.com/git-pkgs/licenses/cmd/licenses@latest
```

[View on GitHub](https://github.com/git-pkgs/licenses)
