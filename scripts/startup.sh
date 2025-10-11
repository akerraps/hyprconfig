#!/usr/bin/env bash
#
# Launch multiple "startup windows" (tty-clock, fastfetch, etc.) on Hyprland startup.
# Keep them open until any "normal" window appears, then close all startup windows automatically.

# List of startup windows: command + class
declare -A STARTUP_WINDOWS
STARTUP_WINDOWS["tty-clock"]="ClockTerm"
STARTUP_WINDOWS["fastfetch"]="FastfetchTerm"
# Add more as needed, format: ["command"]="ClassName"

# Array to store PIDs of launched windows
PIDS=()

# Launch all startup windows
for cmd in "${!STARTUP_WINDOWS[@]}"; do
  class="${STARTUP_WINDOWS[$cmd]}"
  # Launch in Kitty with proper class
  kitty --class "$class" -e "$cmd" &
  PIDS+=($!)
done

# Infinite loop: monitor windows
while true; do
  clients_json=$(hyprctl -j clients)

  # Flag to check if any normal window exists
  NORMAL_FOUND=false

  for class in $(echo "$clients_json" | jq -r '.[].class'); do
    # If class is NOT in startup windows, mark normal found
    if [[ ! " ${STARTUP_WINDOWS[@]} " =~ " $class " ]]; then
      NORMAL_FOUND=true
      break
    fi
  done

  if $NORMAL_FOUND; then
    # Kill all startup windows
    for pid in "${PIDS[@]}"; do
      kill $pid 2>/dev/null
    done
    exit 0
  fi

  sleep 0.5
done
