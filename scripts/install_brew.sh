#!/bin/bash
set -euo pipefail

source "$HOME/.dotfiles/lib/env.sh"

if [[ -x "$BREW" ]]; then
  echo "✅ Homebrew already installed."
else
  echo "🍺 Installing Homebrew..."
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "✅ Homebrew successfully installed."
fi

