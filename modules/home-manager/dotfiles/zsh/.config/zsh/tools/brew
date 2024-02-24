#! /usr/bin/env zsh

if [ ! -f "/opt/homebrew/bin/brew" ]; then
  echo "Homebrew not installed, consider installing."
else
  /opt/homebrew/bin/brew shellenv >> $SET_ENV
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
