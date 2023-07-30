#! /usr/bin/env zsh

cd $(dirname $0)

# mkdir -p ~/.config

for cfg in $(ls); do
  [ ! -d $cfg ] && continue
  echo $cfg
done

