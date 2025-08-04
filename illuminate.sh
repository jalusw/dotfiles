#!/bin/bash

# Clone & enter repo
git clone https://github.com/jalusw/dotfiles.git ~/.dotfiles
cd ~/.dotfiles || exit

# Start setup script
bash ./setup.sh

