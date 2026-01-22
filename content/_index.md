---
title: git-pkgs
layout: hextra-home
---

<div class="hx:mt-6 hx:mb-6">
{{< hextra/hero-headline >}}
  Dependency tools for git
{{< /hextra/hero-headline >}}
</div>

<div class="hx:mb-12">
{{< hextra/hero-subtitle >}}
  A git subcommand that indexes your dependency changes into a queryable database.&nbsp;<br class="hx:sm:block hx:hidden" />Find out who added a package, when, and why.
{{< /hextra/hero-subtitle >}}
</div>

<div class="hx:mb-6 hx:flex hx:gap-4">
{{< hextra/hero-button text="Get Started" link="docs/getting-started" >}}
<a href="docs/installation" class="not-prose hx:font-medium hx:cursor-pointer hx:px-6 hx:py-3 hx:rounded-full hx:text-center hx:inline-block hx:border hx:border-gray-300 hx:dark:border-neutral-700 hx:hover:bg-gray-100 hx:dark:hover:bg-neutral-800 hx:transition-all hx:ease-in hx:duration-200">Installation</a>
</div>

<div class="hx:mt-6"></div>

Your lockfile shows what dependencies you have, but not how you got here. Running `git log Gemfile.lock` produces noise that no one reads. git-pkgs walks through your git history and builds a SQLite database so you can ask: when did we add this? who added it? what changed between releases? has anyone touched this in the last year?

```bash
git pkgs init           # analyze history (one-time)
git pkgs list           # show current dependencies
git pkgs stats          # see overview
git pkgs blame          # who added each dependency
git pkgs history        # all dependency changes over time
git pkgs history rails  # track a specific package
git pkgs why rails      # why was this added?
git pkgs diff --from=HEAD~10  # what changed recently?
git pkgs diff --from=main --to=feature  # compare branches
git pkgs vulns          # scan for known CVEs
git pkgs vulns blame    # who introduced each vulnerability
git pkgs outdated       # find packages with newer versions
git pkgs update         # update all dependencies
git pkgs add lodash     # add a package
```

The database lives in `.git/pkgs.sqlite3` and stays current through git hooks. Core commands work entirely offline with no network access.

<div class="hx:mt-12"></div>

## Vulnerability scanning with context

Static scanners tell you what's vulnerable. git-pkgs tells you who introduced it, when, and how long it took to fix.

```bash
git pkgs vulns                      # scan current dependencies
git pkgs vulns blame                # who introduced each vulnerability
git pkgs vulns praise --summary     # who fixes vulnerabilities fastest
git pkgs vulns history lodash       # timeline for a specific package
```

```
$ git pkgs vulns blame
CRITICAL  CVE-2024-1234  lodash 4.17.15  abc1234  2024-03-15  Alice  "Add utility helpers"
HIGH      GHSA-xxxx      express 4.18.0  def5678  2024-02-01  Bob    "Bump express"
```

<div class="hx:mt-12"></div>

## License compliance

Enforce license policies in CI. Flag copyleft licenses or use an explicit allow list.

```bash
git pkgs licenses                   # show license for each dependency
git pkgs licenses --permissive      # flag copyleft licenses
git pkgs licenses --allow=MIT,Apache-2.0,BSD-3-Clause
```

Exits with code 1 if any dependency fails the policy check.

<div class="hx:mt-12"></div>

## Find outdated packages

Check registries for newer versions. The `--at` flag shows what was outdated at any point in history.

```bash
git pkgs outdated                   # packages with updates available
git pkgs outdated --major           # only major version updates
git pkgs outdated --at v2.0.0       # what was outdated when we released v2.0?
git pkgs outdated --at 2024-01-01   # what was outdated on this date?
```

<div class="hx:mt-12"></div>

## Bisect dependency changes

Binary search through commits that changed dependencies. If you have 1000 commits between good and bad but only 15 changed dependencies, you search 15 instead of 1000.

```bash
git pkgs bisect start
git pkgs bisect bad HEAD
git pkgs bisect good v1.0.0
git pkgs bisect run npm test        # automated bisect with a script
```

<div class="hx:mt-12"></div>

## Generate SBOMs

Export a Software Bill of Materials in CycloneDX or SPDX format.

```bash
git pkgs sbom                       # CycloneDX JSON
git pkgs sbom --type spdx           # SPDX JSON
git pkgs sbom --stateless           # no database needed, works in CI
```

<div class="hx:mt-12"></div>

{{< hextra/feature-grid >}}
  {{< hextra/feature-card
    title="Blame & History"
    subtitle="See who added each dependency, when it was last updated, and the commit message explaining why."
    link="/docs/getting-started"
  >}}
  {{< hextra/feature-card
    title="30+ Package Managers"
    subtitle="Parses lockfiles from npm, RubyGems, Go, Cargo, pip, Composer, Maven, CocoaPods, NuGet, and more."
    link="/docs/modules/managers"
  >}}
  {{< hextra/feature-card
    title="Vulnerability Context"
    subtitle="Not just what's vulnerable, but who introduced it, when, and how long it took to fix."
    link="/docs/vulnerabilities"
  >}}
  {{< hextra/feature-card
    title="License Compliance"
    subtitle="Enforce license policies in CI. Flag copyleft or use an allow list."
    link="/docs/licenses"
  >}}
  {{< hextra/feature-card
    title="Time Travel"
    subtitle="See what was outdated at any point in history. Useful for audits and post-mortems."
    link="/docs/outdated"
  >}}
  {{< hextra/feature-card
    title="Dependency Bisect"
    subtitle="Binary search through commits that changed dependencies. Find when a problem was introduced."
    link="/docs/bisect"
  >}}
  {{< hextra/feature-card
    title="SBOM Export"
    subtitle="Generate CycloneDX or SPDX for compliance workflows and vulnerability tracking."
    link="/docs/sbom"
  >}}
  {{< hextra/feature-card
    title="CI Ready"
    subtitle="Stateless mode works without a database. Output JSON or SARIF for GitHub code scanning."
    link="/docs/ci-cd"
  >}}
  {{< hextra/feature-card
    title="Go Libraries"
    subtitle="Reusable modules for manifest parsing, registry APIs, version ranges, and SPDX licenses."
    link="/docs/modules"
  >}}
{{< /hextra/feature-grid >}}
