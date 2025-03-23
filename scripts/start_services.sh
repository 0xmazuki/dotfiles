#!/bin/bash
set -euo pipefail

source "$HOME/.dotfiles/lib/env.sh"

echo "🔌 Ensuring yabai and skhd services are running..."

if command -v yabai >/dev/null; then
  if [[ ! -f "$HOME/Library/LaunchAgents/com.koekeishiya.yabai.plist" ]]; then
    echo "📦 Installing yabai service..."
    yabai --install-service
  fi
  echo "🚀Starting yabai..."
  yabai --restart-service
fi

if command -v skhd >/dev/null; then
  echo "🚀Starting skhd..."
  skhd --restart-service
fi

echo "✅ Services installed and started."
