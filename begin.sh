#!/bin/bash

OS_TYPE=$(uname -n)

if [ $OS_TYPE == "pop-os" ]; then
    echo "Setting up for Pop_OS"
    echo "Updating and upgrading packages"
    sudo add-apt-repository ppa:neovim-ppa/unstable 

    echo "Installing packages"
    sudo apt-get update && sudo apt-get upgrade -y

    echo "Installing packages"
    sudo apt-get install software-properties-common build-essential vim tmux git \
    curl unzip gnupg ca-certificates lsb-release lynx stow xautolock xss-lock zsh \
    pavucontrol neovim python3 python3-dev python3-pip lua5.1

    echo "Installing Packer for neovim"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    echo "Installing Oh My Zsh for zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Cloning dotfiles"
    git clone https://github.com/jalusw/dotfiles.git dotfiles && cd dotfiles

    echo "Stowing dotfiles"
    stow .
fi

if [ $OS_TYPE == "arch" ]; then
    echo "Setting up for Arch Linux"
    echo "Updating and upgrading packages"
    sudo pacman -Syu

    echo "Installing packages"
    sudo pacman -S base-devel vim tmux git curl unzip gnupg ca-certificates lsb-release lynx stow xautolock xss-lock zsh \
    pavucontrol neovim python3 python3-dev python3-pip lua5.1

    echo "Installing Packer for neovim"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

    echo "Installing Oh My Zsh for zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    echo "Cloning dotfiles"
    git clone https://github.com/jalusw/dotfiles.git dotfiles && cd dotfiles

    echo "Stowing dotfiles"
    stow .
fi

echo "Done"
