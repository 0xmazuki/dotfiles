#!/bin/bash
set -euo pipefail

source "$HOME/.dotfiles/lib/env.sh"

echo "📦 Installing packages from Brewfile..."

if ! command -v brew &>/dev/null; then
  echo "❌ Homebrew not found at $BREW. Please run install_brew.sh first."
  exit 1
fi

if [[ ! -f "$BREWFILE" ]]; then
  echo "⚠️  Brewfile not found at $BREWFILE"
  exit 1
fi

echo "✅ Found Brewfile. Running brew bundle..."
brew bundle --file="$BREWFILE"

echo "🎉 All packages installed successfully."
