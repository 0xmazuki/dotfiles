#!/bin/bash
set -euo pipefail

source "$HOME/.dotfiles/lib/env.sh"

echo "📦 Installing packages from Brewfile..."

# Ensure Homebrew is available in this shell
if ! [[ -x "$BREW" ]]; then
  echo "❌ Homebrew not found at $BREW_PATH. Please run install_brew.sh first."
  exit 1
fi

# Check for Brewfile
if [[ ! -f "$BREWFILE" ]]; then
  echo "⚠️  Brewfile not found at $BREWFILE"
  echo "💡 You can generate one with:"
  echo "   brew bundle dump --file=$BREWFILE --force"
  exit 1
fi

# Run the bundle install
echo "✅ Found Brewfile. Running brew bundle..."
$BREW bundle --file="$BREWFILE"

echo "🎉 All packages installed successfully."

