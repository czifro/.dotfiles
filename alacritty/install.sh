#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -d ~/.config/alacritty ] && mkdir -p ~/.config/alacritty
[ ! -L ~/.config/alacritty/alacritty.yml ] && ln -s $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml

