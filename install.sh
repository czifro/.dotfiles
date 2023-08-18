#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -d ~/.config ]; then
  mkdir -p ~/.config
fi

for cfg in $(ls); do
  [ ! -d $cfg ] && continue
  if [ -f $cfg/install.sh ]; then
    sh $cfg/install.sh || echo "Failed to install dotfile: $cfg"
  fi
done

