#!/usr/bin/env bash

# ==========================================================
# Hyprland Helper Script: launch_or_focus.sh
# ----------------------------------------------------------
# This script switches to a workspace if a window with the
# specified initialTitle exists, or launches the app in the
# given workspace (or current one if omitted).
#
# Usage:
#   launch_or_focus.sh [workspace_num] <initialTitle> <launch_cmd>
# ==========================================================

# Read arguments
if [[ $# -eq 3 ]]; then
  WS="$1"
  TITLE="$2"
  CMD="$3"
elif [[ $# -eq 2 ]]; then
  WS="" # no workspace specified
  TITLE="$1"
  CMD="$2"
else
  echo "Usage: $0 [workspace_num] <initialTitle> <launch_cmd>"
  exit 1
fi

# Check if a client with the given initialTitle exists
TARGET_WS=$(hyprctl clients -j | jq -r ".[] | select(.initialTitle == \"$TITLE\") | .workspace.id" | head -n 1)

if [ -n "$TARGET_WS" ]; then
  # Window exists -> switch to its workspace
  hyprctl dispatch workspace "$TARGET_WS"
else
  # No window found -> determine workspace
  if [ -z "$WS" ]; then
    # Use current workspace if none specified
    WS=$(hyprctl activeworkspace -j | jq -r '.id')
  fi

  # Switch to workspace and launch app
  hyprctl dispatch workspace "$WS"
  sleep 0.3
  $CMD &
fi
