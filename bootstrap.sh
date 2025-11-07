#!/bin/bash

set -e 

source /etc/os-release

echo "Starting bootstrapping..."

# Install ansible
if [ "$PRETTY_NAME" = "Arch Linux" ]; then
  sudo pacman -Syu
  sudo pacman -S base-devel ansible-core
elif [ "$PRETTY_NAME" = "Pop Os" ] | [ "$PRETTY_NAME" = "Ubuntu" ]; then
  sudo apt install -y software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install -y ansible
fi

# Run ansible playbook
make play

# stow
make link