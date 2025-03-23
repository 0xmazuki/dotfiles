#!/bin/bash
set -euo pipefail

source "$HOME/.dotfiles/lib/env.sh"

echo "🛠  Applying macOS system tweaks..."

###############################################################################
# 💻 Keyboard & Input
###############################################################################

# Faster key repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

# Disable "press and hold" for special characters
defaults write -g ApplePressAndHoldEnabled -bool false

# Reverse scroll direction (disable "natural" scrolling)
defaults write -g com.apple.swipescrolldirection -bool false

###############################################################################
# 📁 Finder Preferences
###############################################################################

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show full POSIX path in window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Set default Finder view to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show Library folder
chflags nohidden ~/Library

# Hide desktop icons
defaults write com.apple.finder "CreateDesktop" -bool false

###############################################################################
# 🧱 Dock Preferences
###############################################################################

# Auto-hide Dock immediately (no delay)
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Remove all default Dock apps
defaults write com.apple.dock persistent-apps -array

# Show only running apps in the Dock
defaults write com.apple.dock static-only -bool true

###############################################################################
# 🖼️ Wallpaper
###############################################################################

if [[ -f "$WALLPAPER" ]]; then
  echo "🖼️  Setting wallpaper..."
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$WALLPAPER\""
  echo "✅ Wallpaper set to $WALLPAPER"
else
  echo "❌ Wallpaper not found at $WALLPAPER"
fi

###############################################################################
# 👤 Profile Picture
###############################################################################

if [[ -f "$PROFILE_IMAGE" ]]; then
  echo "🖼️  Setting user profile picture..."
  sudo dscl . delete /Users/$(whoami) JPEGPhoto || true
  sudo dscl . create /Users/$(whoami) Picture "$PROFILE_IMAGE"
  echo "✅ Profile picture set."
else
  echo "❌ Profile picture not found at $PROFILE_IMAGE"
fi

###############################################################################
# 🌀 Restart Affected Services
###############################################################################

killall Dock Finder SystemUIServer || true

echo "✅ macOS tweaks applied."
