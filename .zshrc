# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="bullet-train"
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_PROMPT_ORDER=(
  git
  context
  dir
  time
)

# Plugins
plugins=(git)

# Source oh-my-zsh script
source $ZSH/oh-my-zsh.sh

DEFAULT_USER=$(whoami)

# Export
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export PATH="$HOME/.tmux:$PATH" # Add Tmux

# Aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set options
setopt noflowcontrol
setopt noincappendhistory
setopt nosharehistory
setopt histexpiredupsfirst # Expire duplicate entries first when trimming history.
setopt histignoredups      # Don't record an entry that was just recorded again.
setopt histignorealldups   # Delete old recorded entry if new entry is a duplicate.
setopt histfindnodups      # Do not display a line previously found.
setopt histignorespace     # Don't record an entry starting with a space.
setopt histsavenodups      # Don't write duplicate entries in the history file.
setopt ignoreeof # Don't exit shell on ctrl D

# enable XON/XOFF flow control
stty -ixon

# Pet setup
# zle -N pet-select
# bindkey '^s' pet-select

autoload -U +X bashcompinit && bashcompinit
