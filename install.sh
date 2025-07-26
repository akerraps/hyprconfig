#!/bin/bash

set -e

echo "Starting Hyprland rice installation..."

# === Ensure git and yay are installed ===
if ! command -v yay &>/dev/null; then
  echo "Installing yay (AUR helper)..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ..
  rm -rf yay-bin
fi

# === Clone config repository ===
CONFIG_REPO="https://github.com/akerraps/hyprconfig.git"
CONFIG_CLONE_PATH="$HOME/.config/hypr"

if [ ! -d "$CONFIG_CLONE_PATH" ]; then
  echo "Cloning Hyprland config from $CONFIG_REPO..."
  git clone "$CONFIG_REPO" "$CONFIG_CLONE_PATH"
else
  echo "Config directory already exists: $CONFIG_CLONE_PATH"
fi

# === Set constants ===
TARGET_CONFIG="$HOME/.config"

# === Create necessary directories ===
mkdir -p "$TARGET_CONFIG"
mkdir -p "$HOME/.icons/default"
mkdir -p "$HOME/.config/gtk-3.0"

# === Symlinks ===
echo "Creating config symlinks..."

declare -A SYMLINKS=(
  ["$CONFIG_CLONE_PATH/hyprpanel"]="$TARGET_CONFIG/hyprpanel"
  ["$CONFIG_CLONE_PATH/kitty"]="$TARGET_CONFIG/kitty"
  ["$CONFIG_CLONE_PATH/rofi"]="$TARGET_CONFIG/rofi"
  ["$CONFIG_CLONE_PATH/zsh/.zshrc"]="$HOME/.zshrc"
  ["$CONFIG_CLONE_PATH/vim/.vimrc"]="$HOME/.vimrc"
  ["$CONFIG_CLONE_PATH/vim"]="$HOME/.vim"
  ["$CONFIG_CLONE_PATH/spicetify"]="$TARGET_CONFIG/spicetify"
  ["$CONFIG_CLONE_PATH/sddm/sddm.conf"]="/etc/sddm.conf"
  ["$CONFIG_CLONE_PATH/cursors/index.theme"]="$HOME/.icons/default/index.theme"
  ["$CONFIG_CLONE_PATH/cursors/settings.ini"]="$HOME/.config/gtk-3.0/settings.ini"
)

for src in "${!SYMLINKS[@]}"; do
  dest="${SYMLINKS[$src]}"
  if [ "$dest" = "/etc/sddm.conf" ]; then
    if [ -e "$dest" ] || [ -L "$dest" ]; then
      echo "Skipping existing (requires sudo): $dest"
    else
      echo "Creating symlink with sudo: $src → $dest"
      sudo ln -s "$src" "$dest"
    fi
  else
    if [ -e "$dest" ] || [ -L "$dest" ]; then
      echo "Skipping existing: $dest"
    else
      ln -s "$src" "$dest"
      echo "Linked $src → $dest"
    fi
  fi
done


# === Install Core Packages ===
echo "Installing core packages..."

sudo pacman -S --needed --noconfirm \
  uwsm nerd-fonts rofi antimicrox \
  xdg-desktop-portal-hyprland hyprpolkitagent \
  qt5-wayland qt6-wayland imv swww \
  curl cliphist sddm hyprcursor \
  kitty zsh curl dolphin

curl -f https://zed.dev/install.sh | sh

# === AUR Packages ===
echo "Installing AUR packages with yay..."

# IMPORTANT: Run yay as your normal user (no sudo)
yay -S --needed --noconfirm \
  hyprshot ags-hyprpanel-git sddm-silent-theme \
  phinger-cursors aylurs-gtk-shell-git wireplumber \
  libgtop bluez bluez-utils btop networkmanager \
  dart-sass wl-clipboard python upower pacman-contrib \
  gvfs gtksourceview3 libsoup3 wf-recorder-git \
  hyprpicker matugen-bin python-gpustat

# === Oh My Zsh Setup ===
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Installing zsh-autosuggestions plugin..."
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || echo "Already installed"

# === Run custom scripts ===
if [ -f "$CONFIG_CLONE_PATH/grub-themes/install.sh" ]; then
  echo "Running grub theme installer..."
  bash "$CONFIG_CLONE_PATH/grub-themes/install.sh"
fi

echo "Hyprland rice installation completed!"
