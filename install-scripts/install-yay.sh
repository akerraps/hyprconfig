#!/bin/bash

set -e

if ! command -v yay &>/dev/null; then
  echo "Installing yay (AUR helper)..."
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
fi
