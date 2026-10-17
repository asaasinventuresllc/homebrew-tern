# Homebrew tap for Tern's computer tools

```sh
brew trust --formula asaasinventuresllc/tern/tern-tools
brew install asaasinventuresllc/tern/tern-tools
```

Homebrew 7 and later load a formula from a tap outside Homebrew's own only after you trust it; the first line
trusts this one formula. Later updates are `brew upgrade tern-tools`.

Installs `tern` (Tern's shell server and connector in one program, with `tern-server` and `tern-connector` links)
and the `tern-cli` command-line tool, from the releases at https://github.com/asaasinventuresllc/Tern.

Homebrew installs the programs only. To set up the connector, use the Tern iPhone app or `tern-install.sh
--connector` (see the main repository's README). Remove with `brew uninstall tern-tools`.

The formula is licensed under the Apache License, Version 2.0 (`LICENSE`), as scoped in the main repository's
`NOTICE`.
