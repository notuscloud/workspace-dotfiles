#!/bin/bash

function log {
    echo "[$(date +"%Y-%m-%d %T,%S")]: $*"
}

# Will install tmux and Oh-my-zsh requirements


# ------------
# Oh-my-zsh
# ------------

# Themes
# bullet-train (latest)
log "Installing bullet-train"
[[ -f ~/.oh-my-zsh/themes/bullet-train.zsh-theme ]] && curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme \
  --output ~/.oh-my-zsh/themes/bullet-train.zsh-theme

# ------------
# tmux
# ------------

#  Get tmux plugin manager (latest)
log "Installing tmux plugin manager"
[[ ! -d ~/.tmux/plugins/tpm ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ------------
# final settings
# ------------
if [[ $OSTYPE == "darwin"* ]]; then
  log "OSTYPE: mac detected"
  CONFIG_FOLDER="osx"
elif [[ $OSTYPE == "linux-gnu" ]]; then
  log "OSTYPE: linux detected"
  CONFIG_FOLDER="linux"
else
  log "Unsupported platform... exiting"
  exit 1
fi

log "Switch back to home dir"
cd ~

# @TODO Add a backup of dotfiles function

log "Installing symlink for ${CONFIG_FOLDER}/tmux.conf"
if [[ -e .tmux.conf ]]; then
  log "An existing tmux.conf has been detected, replacing..."
  rm -rf .tmux.conf
fi
ln -s ./dotfiles/${CONFIG_FOLDER}/tmux.conf ~/.tmux.conf

log "Installing symlink for .zshrc"
if [[ -e .zshrc ]]; then
  log "An existing zshrc has been detected, replacing..."
  rm -rf .zshrc
fi
ln -s ./dotfiles/.zshrc ~/.zshrc

log "Deploying .config folder"
if [[ -e .config ]]; then
  log "An existing .config has been detected, replacing..."
  rm -rf .config
fi
ln -s dotfiles/.config

# Return to dotfile install dir
log "Moving back to this script folder"
cd -

# Install nvim pluging
echo "You might need to forcing a nvim plugin install..."
echo "Run: nvim +PluginInstall +qall"
