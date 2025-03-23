#!/bin/bash
set -euo pipefail

echo "🧰 Checking for Xcode Command Line Tools..."

if ! xcode-select -p &>/dev/null; then
  echo "📦 Installing Xcode Command Line Tools..."
  xcode-select --install

  echo "⏳ Waiting for installation to complete..."
  until xcode-select -p &>/dev/null; do
    sleep 5
  done

  echo "✅ Xcode Command Line Tools installed."
else
  echo "✅ Xcode Command Line Tools already installed."
fi
