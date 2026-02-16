#!/bin/bash

Green='\033[0;32m'
Reset='\033[0m'

. ./install-scripts/download-dotfiles.sh

. ./install-scripts/install-git.sh

. ./install-scripts/install-yay.sh

. ./install-scripts/install-core-packages.sh

. ./install-scripts/install-golang.sh

#. ./install-scripts/install-grub.sh

. ./install-scripts/install-icons.sh
stow -R --dotfiles cursors

. ./install-scripts/install-zsh.sh
stow -R --dotfiles zsh

. ./install-scripts/install-ssdm.sh
sudo stow -R sddm -t /etc/

. ./install-scripts/install-walker.sh
stow -R --dotfiles walker

echo -e -e "\n$Green Installing final dotfiles"
stow -R --dotfiles hypr
stow -R --dotfiles hyprpanel
stow -R --dotfiles kitty
stow -R --dotfiles yazi
stow -R --dotfiles nvim
stow -R --dotfiles vim
stow -R --dotfiles zed

. ./install-scripts/enable-daemon-services.sh
