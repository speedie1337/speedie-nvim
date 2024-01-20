#!/bin/sh

if [ -e "$HOME/.config/nvim" ]; then
    rm -rf .config/nvim
    mkdir -p .config
    cp -r $HOME/.config/nvim .config/
    rm -rf .config/nvim/.session.nvim
    rm -rf .config/nvim/lazy-lock.json

    git add .config/* screenshots/ commit.sh install.sh
    git commit -a -m "speedie-nvim | Add new config"
    git push
fi
