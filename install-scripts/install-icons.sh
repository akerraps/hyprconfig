#!/bin/bash

echo -e "\n$Green Installing cursors $Reset"

mkdir -p "$HOME/.icons/default"
mkdir -p "$HOME/.config/gtk-3.0"

yay -S --needed --noconfirm phinger-cursors
