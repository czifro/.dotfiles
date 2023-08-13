#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -d ~/.config/zsh/tools ] && mkdir -p ~/.config/zsh/tools
[ ! -d ~/.config/zsh/env ] && mkdir -p ~/.config/zsh/env

envs=($(ls env))
for e in ${envs[@]}; do
  [ ! -L ~/.config/zsh/env/$e ] && ln -s $(pwd)/env/$e ~/.config/zsh/env/$e
done

[ ! -L ~/.zshrc ] && ln -s $(pwd)/.zshrc ~/.zshrc
[ ! -L ~/.zprofile ] && ln -s $(pwd)/.zsh_profile ~/.zprofile

