#!/bin/sh
echo 3; sleep 1; echo 2; sleep 1; echo 1; sleep 1

[ -e "$HOME/.config/nvim" ] && cp -r $HOME/.config/nvim /tmp/nvim-backup && rm -rf $HOME/.config/nvim

cp -r * $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/spell

echo "installed."
