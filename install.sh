#!/bin/bash

Green='\033[0;32m'
Reset='\033[0m'

. ./install-scripts/download-dotfiles.sh

. ./install-scripts/install-git.sh

. ./install-scripts/install-yay.sh

. ./install-scripts/install-core-packages.sh

. ./install-scripts/install-golang.sh

. ./install-scripts/install-grub.sh

. ./install-scripts/install-icons.sh
stow --dotfiles cursors

. ./install-scripts/install-zsh.sh
stow --dotfiles zsh

. ./install-scripts/install-ssdm.sh
sudo stow sddm -t /etc/

. ./install-scripts/install-walker.sh
stow --dotfiles walker

echo -e -e "\n$Green Installing final dotfiles"
stow --dotfiles hypr
stow --dotfiles hyprpanel
stow --dotfiles kitty
stow --dotfiles yazi
stow --dotfiles nvim
stow --dotfiles vim
