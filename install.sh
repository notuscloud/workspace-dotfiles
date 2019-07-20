#!/bin/bash

# Will install tmux and Oh-my-zsh requirements

# ------------
# Oh-my-zsh
# ------------

# Themes
# bullet-train (latest)
[[ -f ~/.oh-my-zsh/themes/bullet-train.zsh-theme ]] && curl https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme \
  --output ~/.oh-my-zsh/themes/bullet-train.zsh-theme

# ------------
# tmux
# ------------

# tmux plugin manager (latest)
[[ ! -d ~/.tmux/plugins/tpm ]] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ------------
# final settings
# ------------
cd ~
[[ -f .tmux.conf ]] && rm -rf .tmux.conf
ln -s ./dotfiles/.tmux.conf ~/.tmux.conf
[[ -f .zshrc ]] && rm -rf .zshrc
ln -s ./dotfiles/.zshrc ~/.zshrc
[[ ! -e ~/.config ]] && ln -s ./dotfiles/.config ./config
