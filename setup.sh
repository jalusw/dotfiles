#!/bin/bash
set -e

sudo apt update && sudo apt upgrade -y
sudo apt install -y software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
ansible-playbook playbook.yml
