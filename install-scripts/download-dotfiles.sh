#!/bin/bash

CONFIG_REPO="https://github.com/akerraps/hyprconfig.git"
CONFIG_CLONE_PATH="$HOME/hyprconfig"

echo -e "\n$Green Cloning dotfiles from $CONFIG_REPO... $Reset"

if [ ! -d "$CONFIG_CLONE_PATH" ]; then
  git clone "$CONFIG_REPO" "$CONFIG_CLONE_PATH"
else
  echo "Config directory already exists: $CONFIG_CLONE_PATH"
fi
