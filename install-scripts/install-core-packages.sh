#!/bin/bash

sudo pacman -Syu

sudo pacman -S --needed --noconfirm \
  hyprshot uwsm nerd-fonts rofi antimicrox \
  xdg-desktop-portal-hyprland hyprpolkitagent wireplumber \
  qt5-wayland qt6-wayland imv swww libsoup3 dart-sass \
  curl cliphist sddm hyprcursor spotify-launcher gtksourceview3 \
  libgtop bluez bluez-utils btop networkmanager hyprpicker \
  kitty zsh curl nvim dolphin go xclip wl-clipboard less tree \
  grub ntfs-3g python upower pacman-contrib gvfs wl-clipboard \
  blueberry pavucontrol fastfetch zed ripgrep fd lazygit reflector \
  vlc socat yazi ffmpeg 7zip jq poppler zoxide resvg imagemagick \
  ouch man kdeconnect gvfs glib2 gvfs-mtp gvfs-gphoto2 sshfs stow

yay -Syu

yay -S --needed --noconfirm \
  ags-hyprpanel-git sddm-silent-theme phinger-cursors \
  aylurs-gtk-shell-git wf-recorder-git matugen-bin python-gpustat \
  zen-browser-bin brave-bin catppuccin-gtk-theme-frappe \
  cura-bin tty-clock walker-bin elephant elephant-desktopapplications \
  elephant-calc elephant-runner elephant-files elephant-providerlist elephant-websearch elephant-clipboard \
  elephant-symbols elephant-unicode elephant-emojis elephant-todo elephant-bluetooth
