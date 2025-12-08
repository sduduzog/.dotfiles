export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse"

DISABLE_AUTO_UPDATE=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
#
# export PATH=/Users/sdu/.local/bin:$PATH

export PATH="/opt/homebrew/opt/node@24/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@24/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@24/include"
