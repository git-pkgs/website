---
title: Notes
weight: 35
---

Attach arbitrary metadata and messages to packages. Notes are keyed on (purl, namespace) pairs, so you can have separate annotations for different concerns on the same package.

## Basic usage

```bash
git pkgs notes add pkg:npm/lodash@4.17.21 -m "approved for use" --set status=approved
git pkgs notes show pkg:npm/lodash@4.17.21
git pkgs notes list
git pkgs notes remove pkg:npm/lodash@4.17.21
```

Append to an existing note rather than replacing it:

```bash
git pkgs notes append pkg:npm/lodash@4.17.21 -m "re-reviewed Q1 2026" --set reviewer=alice
```

Append concatenates message text (separated by newline) and merges metadata keys into the existing note. If no note exists yet, it creates one.

## Namespaces

Namespaces categorize notes. A package can have one note per namespace.

```bash
git pkgs notes add pkg:npm/lodash -m "no known issues" --namespace security
git pkgs notes add pkg:npm/lodash -m "approved Q4 2025" --namespace audit
git pkgs notes list --namespace security
```

The default namespace is empty. Notes with different namespaces on the same purl are independent.

See which namespaces are in use:

```bash
git pkgs notes namespaces
```

You can scope this to a specific package with `--purl-filter`:

```bash
git pkgs notes namespaces --purl-filter lodash
```

## Metadata

The `--set key=value` flag stores structured key-value pairs. These are persisted as JSON and round-trip through `show -f json`.

```bash
git pkgs notes add pkg:npm/lodash --set status=approved --set reviewer=alice
git pkgs notes show pkg:npm/lodash -f json
```

## Subcommands

```
add <purl>     Create a note (--force to overwrite)
append <purl>  Append message text and merge metadata (creates if missing)
show <purl>    Display a note
list           List all notes
remove <purl>  Delete a note
namespaces     List namespaces with note counts
```

## Options

```
--namespace=NAME   Categorize notes (default: empty)
--origin=NAME      Tool or system that created this note (default: "git-pkgs")
-m, --message=TEXT Freeform text content
--set key=value    Structured metadata (repeatable)
-f, --format=FMT   Output format: text, json
--force            Overwrite existing note (add only)
--purl-filter=STR  Filter by purl substring (list only)
```

## Use cases

### Package policy

Mark packages as approved, deprecated, or banned:

```bash
git pkgs notes add pkg:npm/moment --namespace policy \
  -m "Use dayjs instead" --set status=deprecated --set alternative=dayjs
```

A CI step can compare current dependencies against policy notes and fail the build if a banned package is present.

### Capability tracking

Record what system capabilities packages use (via [capslock](https://github.com/google/capslock) or similar tools):

```bash
git pkgs notes add pkg:golang/github.com/foo/bar --namespace capabilities \
  --set caps=NETWORK,FILES --force
```

### License review decisions

Store the outcome of manual license reviews:

```bash
git pkgs notes add pkg:npm/some-lib --namespace license-review \
  -m "Dual licensed MIT/GPL. Using under MIT per author confirmation." \
  --set decision=approved --set reviewed-by=legal
```

### Sponsorship tracking

Record which open source packages your org sponsors:

```bash
git pkgs notes add pkg:npm/express --namespace sponsorship \
  -m "GitHub Sponsors" --set amount=100 --set since=2025-01
```

Cross-reference with `git pkgs list` to find unsponsored dependencies or sponsorships for packages you no longer use.

### Security review

Track when packages were last reviewed:

```bash
git pkgs notes add pkg:npm/lodash@4.17.21 --namespace security \
  -m "Reviewed source, no concerns" \
  --set reviewed-at=2026-01-20 --set reviewer=alice --set result=pass
```
