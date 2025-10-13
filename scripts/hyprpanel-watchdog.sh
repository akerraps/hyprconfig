#!/bin/bash
set +e

restart_hyprpanel() {
  echo "[*] Restarting Hyprpanel..."

  # Kill Hyprpanel and related scripts
  pkill -f hyprpanel-app
  pkill -f bluetooth.py

  # Find the PID of gjs that has the hyprpanel socket open
  pid=$(lsof -u "$USER" -nP 2>/dev/null | grep 'hyprpanel.sock' | awk '{print $2}' | sort -u)

  if [ -n "$pid" ]; then
    echo "[+] Killing gjs PID(s): $pid"
    kill -9 $pid
  fi

  # Relaunch Hyprpanel
  nohup hyprpanel >/dev/null 2>&1 &
  echo "[+] Hyprpanel relaunched"
}

# --- Listen to Hyprland events ---
SOCKET="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

if [ ! -S "$SOCKET" ]; then
  echo "[-] Could not find Hyprland event socket: $SOCKET"
  exit 1
fi

echo "[*] Listening for Hyprland monitor events..."
echo "[*] Socket: $SOCKET"

socat - "UNIX-CONNECT:$SOCKET" | while read -r line; do
  case "$line" in
  monitoradded* | monitorremoved*)
    echo "[!] Event detected: $line"
    restart_hyprpanel
    ;;
  esac
done
