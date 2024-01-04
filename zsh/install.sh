#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -d ~/.config/zsh/tools ]; then
  mkdir -p ~/.config/zsh/tools
fi

tools=($(ls tools))
for t in ${tools[@]}; do
  if [ ! -L ~/.config/zsh/tools/$t ]; then
    ln -s $(pwd)/tools/$t ~/.config/zsh/tools/$t
  fi 
done

if [ ! -d ~/.config/zsh/env ]; then
  mkdir -p ~/.config/zsh/env
fi

envs=($(ls env))
for e in ${envs[@]}; do
  if [ ! -L ~/.config/zsh/env/$e ]; then
    ln -s $(pwd)/env/$e ~/.config/zsh/env/$e
  fi 
done

if [ ! -L ~/.zshrc ]; then
  ln -s $(pwd)/.zshrc ~/.zshrc
fi
if [ ! -L ~/.zprofile ]; then
  ln -s $(pwd)/.zsh_profile ~/.zprofile
fi

