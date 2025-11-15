#!/bin/bash

echo -e "\n$Green Installing core packages with pacman $Reset"
sudo pacman -Syu

sudo pacman -S --needed --noconfirm \
  hyprshot uwsm nerd-fonts rofi antimicrox \
  xdg-desktop-portal-hyprland hyprpolkitagent wireplumber \
  qt5-wayland qt6-wayland imv swww libsoup3 dart-sass \
  curl cliphist sddm hyprcursor spotify-launcher gtksourceview3 \
  libgtop bluez bluez-utils btop networkmanager hyprpicker \
  kitty curl nvim dolphin xclip wl-clipboard less tree \
  grub ntfs-3g python upower pacman-contrib gvfs wl-clipboard \
  blueberry pavucontrol fastfetch zed ripgrep fd lazygit reflector \
  vlc socat yazi ffmpeg 7zip jq poppler zoxide resvg imagemagick \
  ouch man kdeconnect gvfs glib2 gvfs-mtp gvfs-gphoto2 sshfs stow

echo -e "\n$Green Installing core packages with yay $Reset"

yay -Syu

yay -S --needed --noconfirm \
  ags-hyprpanel-git \
  aylurs-gtk-shell-git wf-recorder-git matugen-bin python-gpustat \
  zen-browser-bin brave-bin sddm-silent-theme catppuccin-gtk-theme-frappe \
  cura-bin tty-clock
