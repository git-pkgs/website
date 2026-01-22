---
title: git-pkgs
layout: hextra-home
---

{{< hextra/hero-badge >}}
  <span>Open Source</span>
  {{< icon name="arrow-circle-right" attributes="height=14" >}}
{{< /hextra/hero-badge >}}

<div class="hx-mt-6 hx-mb-6">
{{< hextra/hero-headline >}}
  Track your dependency history
{{< /hextra/hero-headline >}}
</div>

<div class="hx-mb-12">
{{< hextra/hero-subtitle >}}
  A git subcommand that indexes your dependency changes into a queryable database.&nbsp;<br class="sm:hx-block hx-hidden" />Find out who added a package, when, and why.
{{< /hextra/hero-subtitle >}}
</div>

<div class="hx-mb-6">
{{< hextra/hero-button text="Get Started" link="docs/getting-started" >}}
</div>

<div class="hx-mt-6"></div>

Your lockfile shows what dependencies you have, but not how you got here. Running `git log Gemfile.lock` produces noise that no one reads. git-pkgs walks through your git history and builds a SQLite database so you can ask: when did we add this? who added it? what changed between releases? has anyone touched this in the last year?

```bash
git pkgs init           # index your history (one-time)
git pkgs blame          # who added each dependency
git pkgs history rails  # when was this package changed?
git pkgs why express    # why was this added?
git pkgs diff main..feature  # what changed between branches?
```

The database lives in `.git/pkgs.sqlite3` and stays current through git hooks. Core commands work entirely offline with no network access.

<div class="hx-mt-6"></div>

{{< hextra/feature-grid >}}
  {{< hextra/feature-card
    title="Blame & History"
    subtitle="See who added each dependency, when it was last updated, and the commit message explaining why."
  >}}
  {{< hextra/feature-card
    title="Git-Native"
    subtitle="Respects your git config for colors, pager, and environment. Shell completions included."
  >}}
  {{< hextra/feature-card
    title="Multi-Ecosystem"
    subtitle="Parses lockfiles from npm, RubyGems, Go, Cargo, pip, Composer, Maven, and 30+ other package managers."
  >}}
  {{< hextra/feature-card
    title="Vulnerability Scanning"
    subtitle="Check dependencies against OSV for known CVEs. See who introduced each vulnerability and when it was fixed."
  >}}
  {{< hextra/feature-card
    title="Semantic Diffs"
    subtitle="Compare dependencies between commits, branches, or tags without parsing lockfile noise."
  >}}
  {{< hextra/feature-card
    title="CI Ready"
    subtitle="Run stateless commands in CI without initializing a database. Output JSON or SARIF for GitHub code scanning."
  >}}
{{< /hextra/feature-grid >}}
