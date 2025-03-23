![image](https://github.com/user-attachments/assets/f9a8c280-475c-4c62-848a-27ffe84e4780)

# 🛠️ Mazuki's Dotfiles

Personal, terminal-first dotfiles setup built for macOS (Apple Silicon).  
Minimal, portable, and fully bootstrapped with a single installer script.



## ⚡ Features

- Gruvbox-themed terminal aesthetic (including custom ASCII header)
- Fully automated installer (`install-dotfiles`) with:
  - Xcode CLI tools
  - Homebrew + package install
  - macOS system preferences (`configure_macos.sh`)
  - Stow-based dotfile linking


## 🔧 Tools & Configs

| Tool        | Config Path               | Description                     |
|-------------|---------------------------|---------------------------------|
| **Zsh**     | `zsh/`                    | Shell config + aliases          |
| **GPG**     | `gnupg/.gnupg/`           | GPG + commit signing setup      |
| **SSH**     | `ssh/.ssh/config`         | SSH config for GitHub, etc.     |
| **Yabai**   | `yabai/.config/yabai/`    | Tiling window manager setup     |
| **skhd**    | `skhd/.config/skhd/`      | Hotkey daemon for macOS         |
| **Alacritty** | `alacritty/.config/`    | Terminal emulator with Gruvbox  |
| **Starship** | `starship/.config/`      | Minimal, fast shell prompt      |
| **Git**     | `git/.gitconfig`          | Git config with GPG signing     |
| **Neovim**  | `nvim/.config/nvim`       | Neovim text editor config       |

---

## 🚀 Quick Start

```bash
git clone git@github.com:mazuki/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bin/install-dotfiles
```

## 🧩 Inspired By

- [ThePrimeagen’s dotfiles](https://github.com/ThePrimeagen/.dotfiles)
- [Mathias Bynens’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Gruvbox Theme](https://github.com/morhetz/gruvbox)

