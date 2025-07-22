#!/bin/bash

set -e

if ! command -v apt &> /dev/null; then
    echo "This script requires apt package manager."
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "Installing git."
    sudo apt update
    sudo apt install -y git
fi

if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/jalusw/dotfiles.git "$HOME/dotfiles"
    exit 1
fi

cd "$HOME/dotfiles"

chmod +x setup.sh
echo "🔧 Running setup..."
./setup.sh

