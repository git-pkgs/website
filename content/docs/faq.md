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
