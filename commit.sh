#!/bin/sh

if [ -e "$HOME/.config/nvim" ]; then
    cp -r $HOME/.config/nvim/* .

    git add *
    git commit -a -m "speedie-nvim | Add new config"
    git push
fi
