#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -d ~/.config/alacritty ]; then
  mkdir -p ~/.config/alacritty
fi
if [ ! -L ~/.config/alacritty/alacritty.yml ]; then
  ln -s $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

