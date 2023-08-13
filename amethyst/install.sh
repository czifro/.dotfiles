#! /usr/bin/env zsh

cd $(dirname $0)

[ ! -L ~/.amethyst.yml ] && ln -s $(pwd)/amethyst.yml ~/.amethyst.yml

