#!/usr/bin/env bash

# Save dotfiles
cp ~/.tmux.conf $PWD/tmux.conf
cp ~/.config/nvim/init.vim $PWD/nvim_init.vim

# push to Git
git commit -am "update"
git push
