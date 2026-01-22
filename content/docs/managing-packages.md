---
title: Managing Packages
weight: 50
---

git-pkgs can manage dependencies using the detected package manager. Find outdated packages with `git pkgs outdated`, then update them with `git pkgs update`.

## Detection

git-pkgs looks for lockfiles and maps them to package managers:

| Lockfile | Package Manager |
|----------|-----------------|
| bun.lock | bun |
| pnpm-lock.yaml | pnpm |
| yarn.lock | yarn |
| package-lock.json | npm |
| Gemfile.lock | bundler |
| Cargo.lock | cargo |
| go.sum | gomod |
| uv.lock | uv |
| poetry.lock | poetry |
| composer.lock | composer |
| mix.lock | mix |
| pubspec.lock | pub |
| Podfile.lock | cocoapods |

## Commands

### install

```bash
git pkgs install           # install from lockfile
git pkgs install --frozen  # CI mode: fail if lockfile would change
```

The `--frozen` flag translates to `npm ci`, `bundle install --frozen`, `cargo fetch --locked`, etc.

### add

```bash
git pkgs add lodash
git pkgs add lodash 4.17.21      # specific version
git pkgs add lodash --dev        # dev dependency
```

### remove

```bash
git pkgs remove lodash
```

### update

```bash
git pkgs update              # update all
git pkgs update lodash       # update specific package
```

## Multi-ecosystem projects

If your project has multiple lockfiles, `install` runs for all detected managers:

```
$ git pkgs install
Detected: bundler (Gemfile.lock)
Running: [bundle install]
Detected: npm (package-lock.json)
Running: [npm install]
```

Filter to a specific ecosystem:

```bash
git pkgs install -e npm
```

## Overriding detection

Specify the package manager explicitly:

```bash
git pkgs install -m pnpm
git pkgs add lodash -m yarn
```

## Escape hatch

Pass extra arguments to the underlying tool:

```bash
git pkgs install -x --legacy-peer-deps
git pkgs add lodash -x --save-exact
```

## Dry run

See what would run without executing:

```
$ git pkgs install --dry-run
Detected: npm (package-lock.json)
Would run: [npm install]
```

## Workflow example

```bash
git pkgs outdated            # see what's outdated
git pkgs update              # update patch versions
git pkgs vulns               # check for vulnerabilities
git pkgs diff HEAD           # review what changed
git commit -am "Update dependencies"
```
