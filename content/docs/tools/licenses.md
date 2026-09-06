---
title: licenses
---

Scan a repository for license text using ScanCode's rule corpus. The corpus is embedded in a ~22 MB binary that builds one in-memory index and shares it across goroutines; matching needs no network access, cgo, or Python. Scanning a checkout of rust-lang/cargo (2,950 files, 8-core M1 Pro, default flags) takes 0.65 s and 239 MB peak RSS, against 94 s and 4.5 GB across nine processes for `scancode -l`.

The scanner matches whole-file hashes, exact token sequences, and `SPDX-License-Identifier` tag lines. It does not do approximate matching, so ScanCode reports detections in more files (58 vs 51 on the cargo checkout); differences against ScanCode's own detection suite are tracked in a conformance baseline.

```
licenses .                                     scan the current directory
licenses -json path/to/repo > licenses.json    write a JSON report
licenses -scope all -max-files 0 path          include vendored dependencies
licenses -matched-text -json path              include matched bytes in JSON
licenses -version                              print binary and corpus versions
```

The default `project` scope skips hidden, dependency, build, cache, and test-data directories; use `-scope all` for dependency-license scans. Regular text files are limited to 1 MiB and 32 directory levels, and project scope has a 10,000-file default limit. `-scope all` requires an explicit `-max-files`; setting any limit to zero removes that guard.

## Flags

```
-json           force JSON output
-human          force human-readable output
-scope          project (default) or all
-skip           additional directory names to skip, comma-separated
-max-depth      maximum directory depth (0 is unlimited)
-max-files      maximum files to visit (required with -scope all)
-max-file-size  maximum bytes per file
-workers        concurrent file matchers (max 16)
-matched-text   include matched text in JSON output
-version        print binary and corpus versions
```

## Output

JSON is used when output is redirected; terminals get a text report. Each file record reports detections with rule, expression, kind, method (`hash`, `exact`, `spdx-id`), score, coverage, and byte range, plus `license_text_coverage` for the fraction of decoded bytes covered by license-text and notice matches. Reference rules that join text across document blocks are demoted to `clues` outside `LICENSE`, `COPYING`, and `NOTICE` files; demoted matches stay visible but do not contribute to repository expression totals.

Detection and expression records carry `identification` set to `identified`, `partial`, or `NOASSERTION` depending on whether the expression names concrete licenses or ScanCode `LicenseRef-*` placeholders. A `declared` record is emitted for each recognised package manifest with the raw license values, any license-file path, and a normalised SPDX expression when all values normalise.

Exit status 0 means detections were found, 1 is a fatal command error, 2 means the scan was incomplete because of per-file errors or the file limit, and 3 means no conclusive detections were found.

## Library

The same matcher and repository scanner are available as a Go module; see the [licenses module page](../../modules/licenses/).

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
