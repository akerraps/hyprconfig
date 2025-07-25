#!/bin/bash

set -e

echo "Starting Hyprland rice installation..."

# === Constants ===
CONFIG_DIR="$HOME/.config/hypr"
TARGET_CONFIG="$HOME/.config"

# === Create necessary directories ===
mkdir -p "$TARGET_CONFIG"
mkdir -p "$HOME/.icons/default"
mkdir -p "$HOME/.config/gtk-3.0"

# === Symlinks ===
echo "Creating config symlinks..."

declare -A SYMLINKS=(
  ["$CONFIG_DIR/hyprpanel"]="$TARGET_CONFIG/hyprpanel"
  ["$CONFIG_DIR/kitty"]="$TARGET_CONFIG/kitty"
  ["$CONFIG_DIR/rofi"]="$TARGET_CONFIG/rofi"
  ["$CONFIG_DIR/zsh/.zshrc"]="$HOME/.zshrc"
  ["$CONFIG_DIR/vim/.vimrc"]="$HOME/.vimrc"
  ["$CONFIG_DIR/vim"]="$HOME/.vim"
  ["$CONFIG_DIR/spicetify"]="$TARGET_CONFIG/spicetify"
  ["$CONFIG_DIR/sddm/sddm.conf"]="/etc/sddm.conf"
  ["$CONFIG_DIR/cursors/index.theme"]="$HOME/.icons/default/index.theme"
  ["$CONFIG_DIR/cursors/settings.ini"]="$HOME/.config/gtk-3.0/settings.ini"
)

for src in "${!SYMLINKS[@]}"; do
  dest="${SYMLINKS[$src]}"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "Skipping existing: $dest"
  else
    ln -s "$src" "$dest"
    echo "Linked $src → $dest"
  fi
done

# === Install Core Packages ===
echo "Installing core packages..."

sudo pacman -S --needed \
  uwsm nerd-fonts rofi antimicrox \
  xdg-desktop-portal-hyprland hyprpolkitagent \
  qt5-wayland qt6-wayland imv swww \
  curl cliphist sddm hyprcursor \
  catppuccin-gtk-theme kitty

# === AUR Packages ===
echo "Installing AUR packages..."

yay -S --needed \
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
if [ -f "$CONFIG_DIR/grub-themes/install.sh" ]; then
  echo "Running grub theme installer..."
  bash "$CONFIG_DIR/grub-themes/install.sh"
fi

echo "Installation completed successfully!"
