---
title: Vulnerabilities
weight: 20
---

git-pkgs scans dependencies for known vulnerabilities using the [OSV](https://osv.dev) database. Because git-pkgs tracks the full history of every dependency change, it provides context that static scanners can't: who introduced a vulnerability, when, and why.

## Basic usage

```bash
git pkgs vulns                  # scan at HEAD
git pkgs vulns v1.0.0           # scan at a tag
git pkgs vulns -s high          # only critical and high severity
git pkgs vulns -e npm           # filter by ecosystem
git pkgs vulns -f sarif         # output for GitHub code scanning
```

## Blame

Show who introduced each vulnerability:

```
$ git pkgs vulns blame
CRITICAL  CVE-2024-1234  lodash 4.17.15      abc1234  2024-03-15  Alice   "Add utility helpers"
HIGH      GHSA-xxxx      express 4.18.0      def5678  2024-02-01  Bob     "Bump express"
```

Include fixed vulnerabilities with `--all-time`.

## Praise

Show who fixed vulnerabilities:

```
$ git pkgs vulns praise
CRITICAL  CVE-2024-1234  lodash    ghi9012  2024-04-01  Bob  "Bump lodash"  (12d after disclosure)
```

Author leaderboard:

```
$ git pkgs vulns praise --summary
Author                   Fixes  Avg Days  Critical  High  Medium  Low
-------------------------------------------------------------------------
dependabot[bot]          104    175.4d         6    33      53    12
Andrew Nesbitt            88      8.8d         9    25      45     9
```

## Exposure

Calculate remediation metrics:

```
$ git pkgs vulns exposure --summary
+----------------------------------+
| Total vulnerabilities |        5 |
| Fixed                 |        3 |
| Ongoing               |        2 |
| Median remediation    |   8 days |
| Mean remediation      |  14 days |
| Oldest unpatched      |  45 days |
+----------------------------------+
```

## Diff

Compare vulnerability state between commits:

```bash
git pkgs vulns diff main feature-branch
git pkgs vulns diff v1.0.0 v2.0.0
```

## Log

Show commits that introduced or fixed vulnerabilities:

```
$ git pkgs vulns log
abc1234  2024-03-15  Alice  "Add utility helpers"     +CVE-2024-1234
bcd2345  2024-02-20  Bob    "Security: update async"  -CVE-2023-9999
```

## History

Show vulnerability timeline for a package:

```
$ git pkgs vulns history lodash
2023-01-10  Added lodash 4.17.10 (vulnerable to CVE-2024-1234)  abc1234  Alice
2024-03-20  CVE-2024-1234 published (critical severity)
2024-04-01  Modified lodash 4.17.21  ghi9012  Bob
```

## Show

Details about a specific CVE:

```
$ git pkgs vulns show CVE-2024-1234
CVE-2024-1234 (critical severity)
Prototype Pollution in lodash

Affected packages:
  npm/lodash: >=0 <4.17.21 (fixed in 4.17.21)

Your exposure:
  lodash 4.17.15 in package-lock.json
    Added: abc1234 2024-03-15 Alice "Add utility helpers"
    Fixed: ghi9012 2024-04-01 Bob "Bump lodash for CVE-2024-1234"
```

## Data source

Vulnerability data comes from OSV, which aggregates advisories from GitHub (GHSA), NVD (CVE), RustSec, PyPI, Go, and others. Data is cached locally and refreshed when stale (>24h).
