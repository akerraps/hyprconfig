## Install Universal Wayland Session Manager
```bash
pacman -S uwsm

```
## Install font awesome
```bash
sudo pacman -S ttf-font-awesome
```

## App launcher
To install rofi:
```bash
sudo pacman -S rofi
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
