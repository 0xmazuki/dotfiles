#
export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
export SCRIPTS="$DOTFILES/scripts"



export HOMEBREW_PREFIX="/opt/homebrew"
export BREW="$HOMEBREW_PREFIX/bin/brew"
export BREWFILE="$DOTFILES/Brewfile"

eval "$($BREW shellenv)"

export PATH="$DOTFILES/bin:$PATH"

export WALLPAPER="$DOTFILES/images/smile_gruvbox.png"
export PROFILE_IMAGE="$DOTFILES/images/smile_gruvbox_profile.png"

export EDITOR=nvim
