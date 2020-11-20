# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# ZSH_THEME="ys"
ZSH_THEME=powerlevel10k/powerlevel10k

# BULLETTRAIN_DIR_EXTENDED=1
# BULLETTRAIN_PROMPT_ORDER=(
#   time
#   context
#   dir
#   git
# )
# BULLETTRAIN_CONTEXT_DEFAULT_USER=$(whoami)
# DEFAULT_USER=${BULLETTRAIN_CONTEXT_DEFAULT_USER}

# Plugins
plugins=(git docker kubectl vault fzf zsh-autosuggestions)

# Source oh-my-zsh script
source $ZSH/oh-my-zsh.sh

# Export
export TERM="xterm-256color"
# export CLICOLOR=1
# export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export PATH="$HOME/.tmux:$PATH" # Add Tmux

# Change fzf completion trigger
export FZF_COMPLETION_TRIGGER='//'

# Fix python "Invalid dylib load. Clients should not load the unversioned libcrypto dylib as it does not have a stable ABI."
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_FALLBACK_LIBRARY_PATH

# Aliases
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim='nvim'

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
# stty -ixon

# Pet setup
# zle -N pet-select
# bindkey '^s' pet-select

autoload -U +X bashcompinit && bashcompinit

[[ -f ~/extra.sh ]] && source ~/extra.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
