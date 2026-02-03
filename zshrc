export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="amuse"

DISABLE_AUTO_UPDATE=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOBIN"

export PATH="/opt/homebrew/opt/node@24/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@24/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@24/include"

export PATH="/Users/sdu/.bun/bin:$PATH"

export EDITOR=nvim

# Amp CLI
export PATH="/Users/sdu/.amp/bin:$PATH"
