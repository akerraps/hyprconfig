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

Make it exec on start; This way will work on other DE too:
```bash
cat <<EOF > ~/.config/autostart/io.github.antimicrox.antimicrox.desktop
[Desktop Entry]
Name=AntiMicroX
Comment=Use a gamepad to control a variety of programs
Name[sr]=Анти-микро
Comment[sr]=Користите џојстик или играћу тастатуру за управљање различитим програмима
Name[fr]=AntiMicroX
Comment[fr]=Utilisez une manette de jeu pour commander un logiciel
Name[de]=AntiMicroX
Comment[de]=Nutze ein Gamepad, um Programme/Spiele zu steuern
Comment[uk]=Використовуйте ігровий маніпулятор для керування програмами
Exec=antimicrox --show %f
Icon=io.github.antimicrox.antimicrox
StartupNotify=true
Terminal=false
Type=Application
Categories=Game;Qt;Utility;
MimeType=application/x-amgp;
Keywords=game;controller;keyboard;joystick;mouse;
Actions=run-in-tray;

[Desktop Action run-in-tray]
Name=Open in system tray only
Exec=antimicrox --tray
EOF
```

## Status bar
To install waybar:
```bash
sudo pacman -S waybar
```

### Enable waybar config
To ensure Waybar uses your customized configuration, create a symbolic link (symlink) from the folder .config/hypr/waybar to .config/waybar.
This will allow Waybar to automatically load your configuration when it starts.
```bash
ln -s ~/.config/hypr/waybar ~/.config/waybar
```
To reload waybar config:
```bash
bash ~/.config/waybar/reload_waybar.sh
```

## Bluetooth config

Install blueman gui:
```bash
sudo pacman -S blueman
```

## Whatsapp web
Whatsapp web PWA must be installed for it to autostart

## Notification daemon
Flavour chosen: Frappé (https://github.com/catppuccin/swaync/releases/download/v0.2.3/frappe.css)

```bash
sudo pacman -S swaync
ln -s ~/.config/hypr/swaync ~/.config/
swaync-client -rs
```

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

## Add music player daemon
```bash
sudo pacman -S mpd
```
