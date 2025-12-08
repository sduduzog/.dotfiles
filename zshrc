export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse"

DISABLE_AUTO_UPDATE=true

plugins=(asdf git)

source $ZSH/oh-my-zsh.sh

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

export PATH=/Users/sdu/.local/bin:$PATH
