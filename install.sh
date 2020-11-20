#!/bin/bash

OHMYZSH_PATH=~/.oh-my-zsh
OHMYZSH_VERSION=v0.0.1
OHMYZSH_REPO=astraios/oh-my-zsh

# Silence pushd and popd
pushd () {
    command pushd "$@" > /dev/null
}
popd () {
    command popd "$@" > /dev/null
}

# Log function
function log {
    echo "[$(date +"%Y-%m-%d %T,%S")]: $*"
}

function detect_os {

    # if linux, $OSTYPE should be linux-gnu
    if [[ $OSTYPE == "darwin"* ]]; then
      OS="osx"
    else
      return 1
    fi

    echo $OS
}
# Will install tmux and Oh-my-zsh requirements

# ------------
# Oh-my-zsh
# ------------

# Detect env osx | linux-gnu | docker
OS=$(detect_os)
if [[ $OS == 1 ]]; then
  exit 1
fi

log "Detected OS: $OS"

# Themes
# bullet-train (latest)
log "Installing bullet-train"
if [[ ! -d ~/.oh-my-zsh/themes/bullet-train.zsh-theme && ${CONFIG_FOLDER} != "docker" ]]; then
  curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme \
       --output ~/.oh-my-zsh/themes/bullet-train.zsh-theme
fi

# ------------
# tmux
# ------------

#  Get tmux plugin manager (latest)
log "Installing tmux plugin manager"
[[ ! -d ~/.tmux/plugins/tpm ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ------------
# final settings
# ------------
log "Switch back to home dir"
pushd ~ || exit 1

# @TODO Add a backup of dotfiles function

log "Installing symlink for ${OS}/tmux.conf"
rm -rf .tmux.conf
ln -s ./dotfiles/platform/${OS}/dot.tmux.conf ~/.tmux.conf

log "Installing symlink for .zshrc"
rm -rf .zshrc
ln -s ./dotfiles/platform/${OS}/dot.zshrc ~/.zshrc
ln -s ./dotfiles/platform/${OS}/dot.zshrc-default ~/.zshrc-default

log "Deploying .config folder"
rm -rf .config
ln -s dotfiles/.config .

# Return to dotfile install dir
log "Moving back to this script folder"
popd || exit 1

# Install nvim pluging
echo "You might need to forcing a nvim plugin install..."
echo "Run: nvim +PluginInstall +qall"
