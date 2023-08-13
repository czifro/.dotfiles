#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -d ~/.config/zsh/tools ] && mkdir -p ~/.config/zsh/tools

[ ! -f ~/.config/zsh/tools/brew ] && ln -s $(pwd)/brew.zsh ~/.config/zsh/tools/brew

