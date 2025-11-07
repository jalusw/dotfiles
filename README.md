<h1 align="center">Dotfiles</h1>
<p align="center">
    Reproducible and productive workflow configuration.
</p>

This repository contains my personal configuration that i set up for my own
personal workflow on Linux based system. The operating system that i use is
**Arch** or **Debian** family.

## What this configures

- Shell: zsh + oh-my-zsh, bash
- Editors: Neovim
- Terminals: Kitty, Alacritty
- Window managers: i3, Hyprland

### Personal Preferences

- colorscheme: Rose Pine
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
