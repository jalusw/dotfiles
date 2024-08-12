# dotfiles

This repository contains my dotfiles configuration. I use [GNU
Stow](https://www.gnu.org/software/stow/) to manage them.

## Installation

Pre-requisites:
- `stow`
- `git`
- `zsh`
- `tmux`
- `vim`
- `neovim`
- `fzf`
- `ripgrep`
- `fd`

To install the dotfiles, clone the repository and use `stow` to create the

```bash
git clone https://github.com/jalusw/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -t ~ *
```


