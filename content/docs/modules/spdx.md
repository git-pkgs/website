---
title: spdx
---

Go library for SPDX license expression parsing, normalization, and validation.

Normalizes informal license strings from the real world (like "Apache 2" or "MIT License") to valid SPDX identifiers (like "Apache-2.0" or "MIT"). Useful when working with package metadata from registries where license fields often contain non-standard values.

```go
import "github.com/git-pkgs/spdx"

// Normalize informal strings to valid SPDX identifiers
id, _ := spdx.Normalize("Apache 2")           // "Apache-2.0"
id, _ := spdx.Normalize("MIT License")        // "MIT"
id, _ := spdx.Normalize("GPL v3")             // "GPL-3.0-or-later"
id, _ := spdx.Normalize("BSD 3-Clause")       // "BSD-3-Clause"

// Parse and normalize expressions
expr, _ := spdx.Parse("Apache 2 OR MIT License")
fmt.Println(expr.String())  // "Apache-2.0 OR MIT"

// Validate licenses
spdx.Valid("MIT OR Apache-2.0")     // true
spdx.Valid("FAKEYLICENSE")          // false

// Check license compatibility
satisfied, _ := spdx.Satisfies("MIT OR Apache-2.0", []string{"MIT"})
// true

// Get license categories
cat := spdx.LicenseCategory("MIT")           // CategoryPermissive
cat := spdx.LicenseCategory("GPL-3.0-only")  // CategoryCopyleft

// Check expressions for copyleft
spdx.HasCopyleft("MIT OR Apache-2.0")     // false
spdx.HasCopyleft("MIT OR GPL-3.0-only")   // true
spdx.IsFullyPermissive("MIT OR Apache-2.0") // true
```

## Normalization examples

| Input | Output |
|-------|--------|
| Apache 2 | Apache-2.0 |
| MIT License | MIT |
| GPL v3 | GPL-3.0-or-later |
| BSD 3-Clause | BSD-3-Clause |
| MPL 2.0 | MPL-2.0 |
| CC BY 4.0 | CC-BY-4.0 |

## Installation

```bash
go get github.com/git-pkgs/spdx
```

[View on GitHub](https://github.com/git-pkgs/spdx)
