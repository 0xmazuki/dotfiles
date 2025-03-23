#!/bin/bash
set -euo pipefail

source "$HOME/.dotfiles/lib/env.sh"

echo "📦 Stowing all dotfiles..."
cd "$DOTFILES"

while IFS= read -r module; do
  [[ -z "$module" || "$module" == \#* ]] && continue
  echo "🔗 Stowing $module..."
  stow "$module"
done < "$DOTFILES/modules.txt"

echo "✅ Done."
