#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -d ~/.config/zsh ] && ln -s $(pwd) ~/.config/zsh
[ ! -f ~/.zshrc ] && ln -s ~/.config/zsh/.zshrc ~/.zshrc
[ ! -f ~/.zprofile ] && ln -s ~/.config/zsh/.zsh_profile ~/.zprofile

