---
title: Ecosystem Coverage
weight: 55
---

git-pkgs supports different ecosystems at different levels depending on the underlying capability required.

| Ecosystem | Manifests | Lockfiles | Registry | ecosyste.ms | Managers |
|-----------|-----------|-----------|----------|-------------|----------|
| Alpine | APKBUILD | | | ✓ | |
| Arch | PKGBUILD | | | | |
| Bower | bower.json | | | ✓ | |
| Cargo | Cargo.toml | Cargo.lock | ✓ | ✓ | cargo |
| Carthage | Cartfile | Cartfile.resolved | | ✓ | |
| Clojars | project.clj | | ✓ | ✓ | lein |
| CocoaPods | Podfile, *.podspec | Podfile.lock | ✓ | ✓ | cocoapods |
| Composer | composer.json | composer.lock | ✓ | ✓ | composer |
| Conan | conanfile.txt, conanfile.py | conan.lock | | | conan |
| Conda | environment.yml | | ✓ | ✓ | conda |
| CPAN | cpanfile, META.json | cpanfile.snapshot | ✓ | ✓ | cpanm |
| CRAN | DESCRIPTION | renv.lock | ✓ | ✓ | |
| Crystal | shard.yml | shard.lock | | | shards |
| Deno | deno.json | deno.lock | ✓ | ✓ | deno |
| Docker | Dockerfile, compose.yml | | | ✓ | |
| Dub | dub.json, dub.sdl | | ✓ | | |
| Elm | elm.json | | ✓ | ✓ | |
| Go | go.mod | go.sum | ✓ | ✓ | gomod |
| GitHub Actions | .github/workflows/*.yml | | | ✓ | |
| Hackage | *.cabal | cabal.project.freeze | ✓ | ✓ | cabal, stack |
| Haxelib | haxelib.json | | ✓ | | |
| Hex | mix.exs, gleam.toml | mix.lock, rebar.lock | ✓ | ✓ | mix, rebar3 |
| Homebrew | Brewfile | Brewfile.lock.json | ✓ | ✓ | brew |
| Julia | Project.toml | Manifest.toml | ✓ | ✓ | |
| LuaRocks | *.rockspec | | ✓ | | luarocks |
| Maven | pom.xml, build.gradle, build.sbt | gradle.lockfile, maven.graph.json, dependencies.lock | ✓ | ✓ | maven, gradle, sbt |
| Nimble | *.nimble | | ✓ | | nimble |
| Nix | flake.nix | flake.lock | | | |
| npm | package.json | package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lock | ✓ | ✓ | npm, pnpm, yarn, bun |
| NuGet | *.csproj, packages.config | packages.lock.json, paket.lock | ✓ | ✓ | nuget |
| Pub | pubspec.yaml | pubspec.lock | ✓ | ✓ | pub |
| PyPI | pyproject.toml, requirements.txt | poetry.lock, uv.lock, Pipfile.lock | ✓ | ✓ | pip, poetry, uv |
| RPM | *.spec | | | | |
| RubyGems | Gemfile, *.gemspec | Gemfile.lock | ✓ | ✓ | bundler, gem |
| Swift | Package.swift | Package.resolved | | ✓ | swift |
| vcpkg | vcpkg.json | | | ✓ | vcpkg |

**Manifests** declare dependencies with version ranges. **Lockfiles** pin exact resolved versions and often include integrity hashes.

**Registry** support enables `outdated` and `licenses` commands by querying package registries directly.

**ecosyste.ms** support means the ecosystem is indexed by [packages.ecosyste.ms](https://packages.ecosyste.ms), which git-pkgs uses as a fallback for registry lookups.

**Managers** support enables `install`, `add`, `remove`, `update`, and `browse` commands by wrapping package manager CLIs.
