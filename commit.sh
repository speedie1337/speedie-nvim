#!/bin/sh

if [ -e "$HOME/.config/nvim" ]; then
    rm -rf .config/nvim
    cp -r $HOME/.config/nvim .config/

    git add .config/* commit.sh install.sh
    git commit -a -m "speedie-nvim | Add new config"
    git push
fi
