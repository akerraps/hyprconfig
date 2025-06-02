#!/bin/bash

# Watchdog script to monitor and restart hyprpanel and swww-daemon when needed
# Useful when HDMI is unplugged/replugged and hyprpanel crashes

export WAYLAND_DISPLAY=wayland-1
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

LOGFILE="/tmp/hyprpanel-watchdog.log"

echo "[INFO] Starting hyprpanel watchdog..." | tee -a "$LOGFILE"

while true; do
    # Check if hyprpanel is running
    if ! pgrep -f "hyprpanel.js" > /dev/null; then
        echo "$(date) [WARN] hyprpanel is not running. Restarting..." | tee -a "$LOGFILE"

        # Kill SwayNotificationCenter if stuck
        pkill -f swaync
        pkill -f SwayNotificationCenter
        sleep 1

        # Restart swww-daemon only if the socket exists
        SOCKET_PATH="$XDG_RUNTIME_DIR/swww-${WAYLAND_DISPLAY}.socket"
        if [ -S "$SOCKET_PATH" ]; then
            echo "$(date) [INFO] Killing swww-daemon..." | tee -a "$LOGFILE"
            pkill swww-daemon
            sleep 1
        fi

        if ! pgrep -x swww-daemon > /dev/null; then
            echo "$(date) [INFO] Starting swww-daemon..." | tee -a "$LOGFILE"
            swww-daemon & disown
        else
            echo "$(date) [WARN] swww-daemon already running. Skipping launch." | tee -a "$LOGFILE"
        fi


        echo "$(date) [INFO] Launching hyprpanel..." | tee -a "$LOGFILE"
        sleep 2
        hyprpanel & disown

        echo "$(date) [SUCCESS] hyprpanel and swww-daemon restarted." | tee -a "$LOGFILE"
    fi

    sleep 5
done
