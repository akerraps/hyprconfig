#!/usr/bin/env bash

# ==========================================================
# Hyprland Helper Script: launch_or_focus.sh
# ----------------------------------------------------------
# This script moves to a workspace if a window with a given
# class exists, or launches the app and switches to the
# specified workspace if not.
#
# Usage:
#   launch_or_focus.sh <workspace_num> <class> <launch_cmd>
#
# Example:
#   launch_or_focus.sh 9 "Spotify" "spotify-launcher"
# ==========================================================

WS="$1"
CLASS="$2"
CMD="$3"

# Show help if missing args
if [ -z "$WS" ] || [ -z "$CLASS" ] || [ -z "$CMD" ]; then
  echo "Usage: $0 <workspace_num> <class> <launch_cmd>"
  exit 1
fi

# Check if a client with the given class exists
if hyprctl clients -j | jq -e ".[] | select(.class == \"$CLASS\")" >/dev/null; then
  # Get the workspace where the app is located
  TARGET_WS=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\") | .workspace.id" | head -n 1)

  # Switch to that workspace
  hyprctl dispatch workspace "$TARGET_WS"
else
  # No window found -> launch the app in the target workspace
  hyprctl dispatch workspace "$WS"
  sleep 0.3
  $CMD &
fi
