#!/bin/sh

mkdir -p tmp/ || exit 1
mkdir -p $HOME/.local/share/fonts/Noto-Nerd-Fonts || exit 1
cd tmp/ || exit 1

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz || exit 1
[ ! -f "Noto.tar.xz" ] && exit 1
tar -xpvf Noto.tar.xz || exit 1
cp *.ttf $HOME/.local/share/fonts/Noto-Nerd-Fonts/ || exit 1

cd ..

rm -rf tmp/ || exit 1
