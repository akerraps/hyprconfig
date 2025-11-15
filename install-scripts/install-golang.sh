#!/bin/bash

echo -e "\n$Green Installing golang $Reset"

sudo pacman -S --needed --noconfirm go

go install golang.org/x/tools/gopls@latest
