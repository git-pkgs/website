---
title: capcheck
---

Fail CI when your Go code or its dependencies gain access to new privileged operations: spawning processes, opening sockets, calling cgo, touching the filesystem. Built on [google/capslock](https://github.com/google/capslock).

govulncheck tells you when a dependency has a CVE. capcheck tells you when a dependency (or your own code) gains the ability to do something it couldn't before. You check a baseline into your repo and CI fails when the capability set drifts.

```
capcheck init ./...     analyse and write capcheck.json + capcheck.lock.json
capcheck check ./...    compare against the lock file (default command)
capcheck update ./...   re-analyse and overwrite the lock file
capcheck list ./...     print current capabilities, no baseline
```

Exit code 1 means something changed, with the offending call path printed:

```
capcheck: 1 new capability since baseline

  github.com/you/app gained EXEC
    cmd/server/main.go:42:3   main.run
    handler/upload.go:88:5    handler.processImage
                              github.com/disintegration/imaging.Resize
                              os/exec.Command

Run `capcheck update` to accept, or remove the offending call path.
```

## Configuration

`capcheck.json` controls what you watch. Most projects ignore the noisy capabilities (`FILES`, `NETWORK`, `REFLECT`, `RUNTIME`) and only fail on `EXEC`, `CGO`, `ARBITRARY_EXECUTION`, `UNSAFE_POINTER`, and `MODIFY_SYSTEM_STATE`. `granularity` switches between package-level and function-level diffs. `goos`/`goarch` pin the analysis platform since capslock's results depend on which stdlib files are compiled in; `init` defaults to `linux`/`amd64`.

capcheck does not reimplement any analysis. It calls `github.com/google/capslock/analyzer` directly and the lock file is the same protojson `capslock -output=json` produces. What capcheck adds is the config file, the diff, the exit codes, and the CI ergonomics.

## GitHub Action

```yaml
- uses: git-pkgs/capcheck@v1
  with:
    packages: ./...
```

Installs capcheck, runs `check --format github`, and turns each new capability into an error annotation anchored at the first line of user code in the call path.

## Installation

```bash
go install github.com/git-pkgs/capcheck/cmd/capcheck@latest
```

[View on GitHub](https://github.com/git-pkgs/capcheck)
