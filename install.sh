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
CONFIG_CLONE_PATH="$HOME/.config/hyprconfig"

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
  ["$CONFIG_CLONE_PATH/kitty/kitty.conf"]="$TARGET_CONFIG/kitty/kitty.conf"
  ["$CONFIG_CLONE_PATH/kitty/kitty-themes/themes/Dracula.conf"]="$TARGET_CONFIG/kitty/theme.conf"
  ["$CONFIG_CLONE_PATH/rofi"]="$TARGET_CONFIG/rofi"
  ["$CONFIG_CLONE_PATH/zsh/.zshrc"]="$HOME/.zshrc"
  ["$CONFIG_CLONE_PATH/vim"]="$HOME/.vim"
  ["$CONFIG_CLONE_PATH/vim/.vimrc"]="$HOME/.vimrc"
  ["$CONFIG_CLONE_PATH/nvim"]="$TARGET_CONFIG/nvim"
  ["$CONFIG_CLONE_PATH/sddm/sddm.conf"]="/etc/sddm.conf"
  ["$CONFIG_CLONE_PATH/cursors/index.theme"]="$HOME/.icons/default/index.theme"
  ["$CONFIG_CLONE_PATH/cursors/settings.ini"]="$TARGET_CONFIG/gtk-3.0/settings.ini"
  ["$CONFIG_CLONE_PATH/config/"]="$TARGET_CONFIG/hypr/"
  ["$CONFIG_CLONE_PATH/hyprland.conf"]="$TARGET_CONFIG/hypr/hyprland.conf"
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
  hyprshot uwsm nerd-fonts rofi antimicrox \
  xdg-desktop-portal-hyprland hyprpolkitagent wireplumber \
  qt5-wayland qt6-wayland imv swww libsoup3 dart-sass \
  curl cliphist sddm hyprcursor spotify-launcher gtksourceview3 \
  libgtop bluez bluez-utils btop networkmanager hyprpicker \
  kitty zsh curl nvim dolphin go xclip wl-clipboard less tree \
  grub ntfs-3g python upower pacman-contrib gvfs wl-clipboard \
  blueberry pavucontrol fastfetch zed ripgrep fd lazygit

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

vim +PlugInstall +qall
nvim +PlugInstall +qall

# === AUR Packages ===
echo "Installing AUR packages with yay..."

# IMPORTANT: Run yay as your normal user (no sudo)
yay -S --needed --noconfirm \
  ags-hyprpanel-git sddm-silent-theme phinger-cursors \
  aylurs-gtk-shell-git wf-recorder-git matugen-bin python-gpustat \
  zen-browser-bin brave-bin catppuccin-gtk-theme-frappe \
  cura-bin

# === Oh My Zsh Setup ===
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Installing zsh-autosuggestions plugin..."
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" || echo "Already installed"

ln -sf $CONFIG_CLONE_PATH/zsh/.zshrc $HOME/.zshrc

# === Run custom scripts ===
if [ -f "$CONFIG_CLONE_PATH/grub-themes/install.sh" ]; then
  echo "Running grub theme installer..."
  cd $CONFIG_CLONE_PATH/grub-themes/
  sudo bash "$CONFIG_CLONE_PATH/grub-themes/install.sh"
fi

go install golang.org/x/tools/gopls@latest

echo "Hyprland rice installation completed!"
