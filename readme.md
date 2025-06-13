# 🌿 My First Hyprland Rice

Welcome to my very first **rice** using **Hyprland** — a dynamic and highly customizable Wayland compositor.
This setup is still **a work in progress**, so some parts are unfinished or not fully configured yet.

---

## 🎨 Screenshot

![My first rice](resources/My_first_rice.png)

---

## 🗂️ Current Setup

- **Hyprpanel** — custom **Nord**-inspired theme with transparent blurred background and widgets for workspace, clock, and system info.
- **Kitty Terminal** — fast, GPU-accelerated terminal emulator.
- **Rofi** — lightweight and highly configurable application launcher.
- **zsh** — my default shell, powered by **Oh My Zsh** with the `zsh-autosuggestions` plugin for command suggestions, aliases, and a custom prompt theme.

---

## ⚙️ Full Installation Guide

This guide installs all the essential packages and creates the necessary config symlinks to replicate this rice.
It’s intended for **Arch Linux** or Arch-based distributions, and assumes you already have **yay** installed.

---

## 🚀 Quick Setup (Copy & Paste)

```bash
# --- Create config symlinks ---
mkdir -p ~/.config

ln -s ~/.config/hypr/hyprpanel/ ~/.config/hyprpanel   # Hyprpanel config
ln -s ~/.config/hypr/kitty/ ~/.config/kitty           # Kitty terminal config
ln -s ~/.config/hypr/rofi/ ~/.config/rofi             # Rofi launcher config
ln -s ~/.config/hypr/zsh/.zshrc ~                     # zsh configuration file
ln -s ~/.config/hypr/vim/.vimrc ~                     # Vim configuration file
ln -s ~/.config/hypr/vim ~/.vim                       # Vim folder

# --- Core packages ---
sudo pacman -S \
  uwsm \                                # Wayland session manager for Hyprland
  nerd-fonts \                          # Icon fonts (e.g. Font Awesome)
  rofi \                                # Application launcher
  antimicrox \                          # Map gamepad to keyboard/mouse
  xdg-desktop-portal-hyprland \         # Enables screen sharing, portals, etc.
  hyprpolkitagent \                     # GUI Polkit agent for authentication prompts
  qt5-wayland qt6-wayland \             # Qt apps support in Wayland
  imv \                                 # Lightweight image viewer
  catppuccin-gtk-theme \                # Clean GTK theme
  swww \                                # Wallpaper daemon
  curl

# --- AUR packages (via yay) ---
yay -S \
  hyprshot \                            # Screenshot tool for Wayland
  ags-hyprpanel-git                     # Customizable Hyprland status bar

yay -S --needed \
  aylurs-gtk-shell-git wireplumber libgtop bluez bluez-utils btop networkmanager dart-sass \
  wl-clipboard swww python upower pacman-contrib gvfs gtksourceview3 libsoup3 \
  wf-recorder-git hyprpicker matugen-bin python-gpustat

# --- Install Oh My Zsh ---
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --- Extra zsh plugins ---
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## 📦 What’s Included

| Component                      | Description                                                                                  |
|--------------------------------|----------------------------------------------------------------------------------------------|
| **uwsm**                       | Wayland session manager required by Hyprland                                                 |
| **nerd-fonts**                 | Icon-rich fonts (Font Awesome, Nerd icons) for panels, prompts, and terminals                |
| **rofi**                       | Fast, highly customizable application launcher                                               |
| **antimicrox**                 | Map game controller buttons to keyboard and mouse actions                                    |
| **xdg-desktop-portal-hyprland** | Enables screen sharing, portal integrations, and desktop environment interoperability       |
| **hyprpolkitagent**            | GUI Polkit agent to handle authentication prompts (e.g. sudo password dialogs)               |
| **qt5-wayland**, **qt6-wayland** | Ensures that Qt5/Qt6 applications run smoothly under Wayland                                |
| **imv**                        | Lightweight, simple image viewer for quick previews                                          |
| **catppuccin-gtk-theme**       | Clean and cohesive GTK theme for applications with GTK interfaces                            |
| **swww**                       | Wallpaper daemon for setting and transitioning backgrounds dynamically                       |
| **hyprshot** *(AUR)*           | Screenshot tool specifically designed for Wayland and Hyprland                               |
| **ags-hyprpanel-git** *(AUR)*  | Fully customizable status bar (panel) for Hyprland                                           |
| **zsh + Oh My Zsh**            | Modern shell with plugins, theme management, command autosuggestions, and productivity tweaks |

## ✅ Requirements
- Arch Linux or Arch-based distro
- `yay` installed
- Hyprland config files under ~/.config/hypr/
