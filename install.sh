#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -d ~/.config ] && mkdir -p ~/.config

for cfg in $(ls); do
  [ ! -d $cfg ] && continue
  [ -f $cfg/install.sh ] && sh $cfg/install.sh
done

