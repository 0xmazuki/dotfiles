source "$HOMEBREW_PREFIX/opt/antidote/share/antidote/antidote.zsh"
source "$DOTFILES/zsh/aliases.zsh"

autoload -U compinit; compinit

antidote load < "$DOTFILES/zsh/.zsh_plugins.txt"

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
