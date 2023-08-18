#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -L ~/.amethyst.yml ]; then
  ln -s $(pwd)/amethyst.yml ~/.amethyst.yml
fi

