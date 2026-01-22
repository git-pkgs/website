---
title: FAQ
weight: 60
---

## Does git-pkgs work with private registries?

For commands that **query registries** (`outdated`, `licenses`, SBOM enrichment):

git-pkgs extracts registry URLs from lockfiles when the format supports it:
- npm: package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lock
- pypi: Pipfile.lock, poetry.lock, uv.lock
- cargo, composer, gem lockfiles

If your lockfile points to a private registry (like Artifactory or GitHub Packages), those URLs are used automatically. However, git-pkgs doesn't currently read config files like `.npmrc` or `.pypirc` for registry URLs or credentials. Authenticated private registries aren't supported yet for registry queries.

For commands that **run package managers** (`install`, `add`, `remove`, `update`):

These delegate to the actual CLI tools, which respect their native config files. Private registries, proxies, and credentials work as you'd expect.

## How is git-pkgs related to ecosyste.ms?

[ecosyste.ms](https://ecosyste.ms) is a set of open APIs for package ecosystem data, created by [Andrew Nesbitt](https://nesbitt.io) (who also created git-pkgs). git-pkgs can query package registries directly, but ecosyste.ms also provides source repository information for each package which often gives a better picture.

You can bypass ecosyste.ms and query registries directly with `git config pkgs.direct true`. This is useful for private registries or airgapped environments.

## Wasn't this originally written in Ruby?

Yes. The [original git-pkgs](https://github.com/andrew/git-pkgs) was a Ruby gem. This Go rewrite ships as a single binary for easier installation and enables future integration with projects like [gittuf](https://gittuf.dev), [sbommit](https://github.com/sbommit), and [Forgejo](https://forgejo.org).

## Do I need to commit my lockfiles?

For best results, yes. Manifests (like `package.json` or `Gemfile`) show version ranges, but lockfiles show what actually got installed, including transitive dependencies. Without lockfiles, git-pkgs can only track your direct dependencies and their declared ranges.

## What's stateless mode?

Most commands have a `--stateless` flag that parses manifest files directly instead of querying the database. Use it when you haven't run `git pkgs init`, or in CI where you just want to diff two refs without building a full history. Stateless mode is faster for one-off checks but doesn't give you historical queries like `blame` or `history`.

## Does git-pkgs track transitive dependencies?

Yes, if they're in your lockfiles. Lockfiles capture the full dependency tree, so git-pkgs can track when transitive dependencies changed even if you didn't touch your direct dependencies.

## Does git-pkgs modify my code?

The core commands (`list`, `history`, `blame`, `diff`, `vulns`, etc.) are read-only. They query your git history and the database but never modify files.

Commands like `install`, `add`, `remove`, and `update` run your package manager's CLI, which will modify manifests and lockfiles as you'd expect.

## How can I contribute?

There are several ways to help:

- **Add support for new package managers** - The [managers](https://github.com/git-pkgs/managers) library uses YAML definitions, so adding a new package manager often doesn't require writing Go code
- **Add support for new lockfile formats** - The [manifests](https://github.com/git-pkgs/manifests) library parses lockfiles and manifests
- **Request or build new features** - Open an issue to discuss ideas before starting work
- **Testing and bug reports** - Try git-pkgs on your projects and report issues on [GitHub](https://github.com/git-pkgs/git-pkgs/issues)

## Was AI used to create this project?

Yes. [Claude Code](https://claude.ai/code) was used in the development of git-pkgs.
