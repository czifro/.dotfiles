#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -d ~/.local/bin ]; then
  mkdir -p ~/.local/bin
fi

if [ ! -L ~/.local/bin/tmux-sessionizer ]; then
  ln -s $(pwd)/tmux-sessionizer ~/.local/bin/tmux-sessionizer
fi
if [ ! -L ~/.tmux.conf ]; then
  ln -s $(pwd)/tmux.conf ~/.tmux.conf
fi

