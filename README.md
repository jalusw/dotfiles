<h1 align="center">Dotfiles</h1>
<p align="center">
    Reproducible and productive workflow configuration.
</p>

This repository contains my personal configuration that i set up for my own
personal workflow on Linux based system. The Linux distro that i use is
**Arch** or **Debian** family.

## What this configures

- Shell: zsh + oh-my-zsh, bash
- Editors: Neovim
- Terminals: Kitty, Alacritty
- Window managers: i3, Hyprland

### Personal Preferences

- colorscheme: Monochromatic (black and white dark theme)
- font: Fira Code Nerd Font Mono

## Setup Guide

### Quick setup using bootstrap script

**Pre requisites**:
- curl

```bash
curl -fsSL https://raw.githubusercontent.com/jalusw/dotfiles/main/bootstrap.sh | bash
```

### Manually setup

**Pre requisites**:
- git
- ansible
- stow
- make (optional)

1. Clone and enter the repository
```bash
git clone https://github.com/jalusw/dotfiles.git .dotfiles
cd .dotfiles
```

2. Run ansible playbook to install packages
```bash
sudo ansible-playbook ./ansible/playbook.yml
# or using makefile
make play
```

3. Link the configuration using stow
```bash
stow .
# or using makefile
make link
```

### Available runner

- `bootstrap` bootstrap the environment.
- `play` run the ansible playbook.
- `link` stow and link the configuration.
- `unlink` unlink the configuration.

## Monochromatic theme

A cohesive terminal/dev-environment black and white dark theme:
near-black/deep-navy surfaces (`#0A0A12` / `#14141F` / `#1E1E2E`) with
monochromatic gray shades used for accents.

### Palette

| role | color | pair (2nd hex) |
|------|-------|----------------|
| bg0 / bg1 / bg2 | `#0A0A12` / `#14141F` / `#1E1E2E` | |
| fg0 / fg1 / border | `#E8E6F0` / `#9C9AB0` / `#2A2A3D` | |
| primary/light/lighter | `#CCCCCC` / `#E0E0E0` / `#F0F0F0` | |
| dark/darker/muted | `#888888` / `#555555` / `#333333` | |

### Where each file goes

All files live in this repo (stow target `~`):

| tool | path in repo | install location |
|------|--------------|------------------|
| Alacritty | `.config/alacritty/alacritty.toml` | `~/.config/alacritty/alacritty.toml` |
| tmux | `.tmux.conf` | `~/.tmux.conf` |
| Starship | `.config/starship.toml` | `~/.config/starship/starship.toml` |
| Neovim | `.config/nvim/colors/monochrome.lua` | `~/.config/nvim/colors/monochrome.lua` (set via `lazy.nvim` `colorscheme = "monochrome"`) |
| Zsh palette | `.shell/zsh/exports.zsh` | sourced as part of `~/.zshrc` |
| Zsh prompt fallback | `.shell/zsh/prompt.zsh` | sourced as part of `~/.zshrc` |

Apply everything with `make link` (stow). Extra non-stow targets for reference:
`.config/btop/themes/monochrome.theme` → `~/.config/btop/themes/`.

Design rules: backgrounds always stay in the bg0–bg2 range; gradients are
applied diagonally (quadrant blocks in tmux, borders/glow elsewhere); flat
syntax/ANSI colors use the **gray** shades; all fg-on-bg text
meets WCAG AA (≥4.5:1) against bg0/bg1 — `#888888` is therefore only ever a
border/decoration color, never body text; one dominant accent (gray) per
tool, others used for semantics (error=darker, success=light, warning=lighter).

### Derived colors (ANSI 16 slots)

The 16 ANSI slots consume only 8 palette hexes, so the bright/dim rows are
derived by lightening/darkening the nearest accent by ~15% (used by Alacritty
and Neovim's `g:terminal_color_*`):

- bright (+15%): `#1C1C28` (bg0), `#666666` (darker), `#DDDDDD` (light),
  `#AAAAAA` (primary), `#AAAAAA` (primary), `#999999` (dark),
  `#EEEEEE` (lighter), `#EBEBF2` (fg0)
- dim (−15%, Alacritty only): `#08080E`, `#444444`, `#BBBBBB`,
  `#888888`, `#888888`, `#777777`, `#CCCCCC`, `#C5C4CC`
