#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -f ~/.amethyst.yml ] && ln -s $(pwd)/amethyst.yml ~/.amethyst.yml

