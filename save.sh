#!/usr/bin/env bash

# Save dotfiles
cp ~/.tmux.conf $PWD/tmux.conf

# push to Git
git commit -am "update"
git push
