#!/bin/bash
set +e

# Mata hyprpanel y scripts relacionados
pkill -f hyprpanel-app
pkill -f bluetooth.py

# Busca el PID de gjs que tiene abierto el socket hyprpanel
pid=$(lsof -u $USER -nP | grep 'hyprpanel.sock' | awk '{print $2}' | sort -u)

if [ -n "$pid" ]; then
    echo "[+] Killing gjs PID(s): $pid"
    kill -9 $pid
fi

# Relanza hyprpanel
nohup hyprpanel >/dev/null 2>&1 &

