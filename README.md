# Dotfiles

Personal shell and editor configuration for Linux and macOS, managed by [dotbot](https://github.com/anishathalye/dotbot).

This repo contains my zsh, Neovim, and terminal configs. Running the install script symlinks everything into place — no manual copying needed, and safe to re-run at any time.

## Setup

1. Clone the repo (with submodules):
   ```bash
   git clone --recurse-submodules https://github.com/mudejar/dotfiles.git ~/.dotfiles
   ```

2. Run the installer:
   ```bash
   cd ~/.dotfiles && ./install
   ```

This reads `install.conf.yaml` and creates symlinks from your home directory into the repo. It's idempotent, so running it again won't break anything.

**Requires:** Python 3.8+

## What Gets Symlinked

| Source (this repo)     | Target                   |
|------------------------|--------------------------|
| `zshrc`                | `~/.zshrc`               |
| `config/nvim/`         | `~/.config/nvim`         |
| `config/zsh/`          | `~/.config/zsh`          |
| `config/terminator/`   | `~/.config/terminator`   |

Existing symlinks are overwritten on install (`relink: true`).

## What's Included

```
.
├── install              # Dotbot install script
├── install.conf.yaml    # Symlink and cleanup rules
├── zshrc                # Main zsh config (sources plugins and aliases from config/zsh/)
└── config/
    ├── nvim/            # Neovim config (NvChad v2.5 + lazy.nvim)
    ├── zsh/             # Zsh plugins (vendored) and aliases
    └── terminator/      # Terminator terminal emulator config
```

## Tools You'll Need

These are expected to be installed on your system for everything to work:

- [fzf](https://github.com/junegunn/fzf) — fuzzy finder
- [fd](https://github.com/sharkdp/fd) — fast file search
- [bat](https://github.com/sharkdp/bat) — syntax-highlighted cat
- [eza](https://github.com/eza-community/eza) — modern ls replacement
- [zoxide](https://github.com/ajeetdsouza/zoxide) — smarter cd
- [nvim](https://neovim.io/) — Neovim
- [nvm](https://github.com/nvm-sh/nvm) — Node version manager
