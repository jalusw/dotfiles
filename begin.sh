#!/bin/bash

if [ $(uname -n) == "pop-os" ]; then
    sudo add-apt-repository ppa:neovim-ppa/unstable 
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install software-properties-common build-essential vim tmux git \
    curl unzip gnupg ca-certificates lsb-release lynx stow xautolock xss-lock zsh \
    pavucontrol neovim python3 python3-dev python3-pip lua5.1

    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    git clone https://github.com/noctvale/nightsbane.git nightsbane && cd nightsbane

    stow .
fi
