#!/bin/bash

. ./install-scripts/install-git.sh
. ./install-scripts/install-yay.sh

stow --dotfiles hypr
stow --dotfiles hyprpanel
stow --dotfiles kitty
stow --dotfiles yazi
stow --dotfiles walker
stow --dotfiles zsh
stow --dotfiles nvim
stow --dotfiles vim
stow --dotfiles cursors
sudo stow sddm -t /etc/
