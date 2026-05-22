---
title: cooldown
---

An ecosystem-agnostic version-age filter. Hides versions published too recently so the community has time to spot malicious releases before they're pulled into projects.

```go
import "github.com/git-pkgs/cooldown"

cfg := &cooldown.Config{
    Default:    "48h",                           // global window
    Ecosystems: map[string]string{"npm": "72h"}, // npm gets longer
    Packages:   map[string]string{
        "pkg:npm/htmx.org": "0",                 // 0 = disabled
    },
}

if cfg.IsAllowed("npm", "pkg:npm/lodash", publishedAt) {
    // version cleared the window
}
```

The same `Config` shape covers npm, PyPI, Cargo, RubyGems, Composer, Conda, Hex, NuGet, Pub, and any future ecosystem. Resolution order is package PURL, then ecosystem name, then global default, so a single config can express a strict default with targeted opt-outs.

`Config.For(ecosystem, purl)` returns the effective duration for surfacing the policy in a UI. `Config.Enabled()` is a cheap check before walking a large version set. Duration strings accept Go's standard formats (`48h`, `30m`, `1h30m`) plus a `d` suffix for days.

Originally lived inside [proxy](https://github.com/git-pkgs/proxy) and was lifted out once the same predicate showed up in CLIs, dependency-update bots, and scanners.

## Installation

```bash
go get github.com/git-pkgs/cooldown
```

[View on GitHub](https://github.com/git-pkgs/cooldown)
