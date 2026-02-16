# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for Linux and macOS, managed by [dotbot](https://github.com/anishathalye/dotbot). Dotbot is included as a git submodule under `dotbot/`.

## Key Command

```bash
./install            # Run dotbot to create symlinks (idempotent, safe to re-run)
```

This reads `install.conf.yaml` and creates symlinks from `$HOME` into this repo. The install script must remain idempotent.

## Repository Structure

- `install.conf.yaml` — Dotbot configuration defining symlinks and cleanup rules
- `zshrc` — Main zsh configuration, symlinked to `~/.zshrc`
- `config/` — Symlinked into `~/.config/`, contains:
  - `nvim/` — Neovim config using NvChad v2.5 with lazy.nvim plugin manager
  - `zsh/` — Zsh plugins (powerlevel10k, zsh-autosuggestions, fzf-git, kube-ps1, history-substring-search) and aliases
  - `terminator/` — Terminator terminal emulator config

## How Symlinks Work

Defined in `install.conf.yaml`. Key mappings:
- `~/.zshrc` → `zshrc`
- `~/.config/nvim` → `config/nvim/`
- `~/.config/terminator` → `config/terminator/`
- `~/.config/zsh` → `config/zsh`

The `relink: true` default means existing symlinks are overwritten on install.

## Editing Conventions

- **zshrc**: Sources `~/.config/zsh/zsh_aliases` for aliases and `~/.zprofile` for machine-specific private config. The p10k instant prompt block must stay at the top.
- **Neovim plugins**: Add new plugins as files in `config/nvim/lua/plugins/`. Plugin configs go in `config/nvim/lua/configs/`. Custom keymaps are in `config/nvim/lua/mappings.lua`.
- **Zsh plugins**: Vendored directly in `config/zsh/` (not managed as submodules). After adding a new plugin, source it from `zshrc`.
- **lazy-lock.json** is gitignored.

## External Tool Dependencies

The zshrc expects these tools to be installed on the system: `fzf`, `fd`, `bat`, `eza`, `zoxide`, `nvim`, `nvm`.
