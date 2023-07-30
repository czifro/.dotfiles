#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -d ~/.config/alacritty ] && ln -s $(pwd) ~/.config/alacritty

