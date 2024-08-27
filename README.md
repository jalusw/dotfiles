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

Font : [`FiraCode Nerd Font`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)

On Ubuntu 

```
sudo apt update && sudo apt upgrade -y
sudo apt install stow git zsh tmux vim fzf ripgrep fd-find kitty build-essential
```

To install the dotfiles, clone the repository and use `stow` to create the

```bash
git clone https://github.com/jalusw/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -t ~ *
```


