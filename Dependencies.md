## Install Universal Wayland Session Manager
```bash
pacman -S uwsm

```
## Install font awesome
```bash
sudo pacman -S nerd-fonts
```

## App launcher
To install rofi:
```bash
sudo pacman -S rofi
```

## Antimicrox
Install app:
```bash
sudo pacman -S antimicrox
```

## Whatsapp web
Whatsapp web PWA must be installed for it to autostart

## Screenshot service
```bash
yay -S hyprshot
```

## Hyprland’s xdg-desktop-portal implementation
It allows for screensharing, global shortcuts, etc.
```bash
sudo pacman -S xdg-desktop-portal-hyprland
```

## Authentication daemon
It is required for GUI applications to be able to request elevated privileges.
```bash
sudo pacman -S hyprpolkitagent
```

## Qt Wayland Support
```bash
sudo pacman -S qt5-wayland qt6-wayland
```

## Image viewer
```bash
sudo pacman -S imv
```

## Add kitty config
```bash
cd ~/.config
ln -s hypr/kitty/ .
```

## Install catppuccin themes
```bash
sudo pacman -S catppuccin-gtk-theme
```

## Enable rofi configuration
```bash
ln -s ~/.config/hypr/rofi/ ~/.config/
```

## Add hyprpanel
Note that is recommended to link the hyprpanel config before installign it
```bash
ln -s ~/.config/hypr/hyprpanel/ ~/.config/
yay -S ags-hyprpanel-git
sudo pacman -S swww
```
