#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -d ~/.config/zsh/tools ]; then
  mkdir -p ~/.config/zsh/tools
fi

if [ ! -L ~/.config/zsh/tools/brew ]; then
  ln -s $(pwd)/brew.zsh ~/.config/zsh/tools/brew
fi

