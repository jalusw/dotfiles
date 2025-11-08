#!/usr/bin/env bash
set -euo pipefail

. /etc/os-release

echo "Starting bootstrapping..."

case "${ID:-}" in
  arch)
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm base-devel ansible-core
    ;;
  ubuntu|pop|debian)
    sudo apt-get update -y
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible || true
    sudo apt-get install -y ansible
    ;;
  *)
    echo "Unsupported OS: ${ID:-unknown}" >&2
    exit 1
    ;;
esac

make play
make link