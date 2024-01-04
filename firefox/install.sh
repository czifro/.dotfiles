#! /usr/bin/env zsh

cd $(dirname $0)

if [ ! -d ~/.mozilla ]; then
  mkdir ~/.mozilla
fi

if [ ! -L ~/.mozilla/firefox ]; then
  ln -s ~/Library/Application\ Support/Firefox ~/.mozilla/firefox
fi

firefox_profiles=($(
  ls ~/.mozilla/firefox/Profiles/* \
  | grep ":" \
  | cut -d ':' -f 1 \
  | sed 's/ /\\ /'
))

for profile in "${firefox_profiles[@]}"; do
  if [ ! -L $profile/user.js ]; then
    ln -s $(pwd)/user.js $profile/user.js
  fi

  if [ ! -d $profile/chrome ]; then
    mkdir $profile/chrome
  fi

  if [ ! -L $profile/chrome/userChrome.css ]; then
    ln -s $(pwd)/userChrome.css $profile/chrome/userChrome.css
  fi

  # May not be necessary, but don't want to redo steps to find out
  # if [ ! -L $profile/chrome/userChrome-overrides.css ]; then
  #   ln -s $(pwd)/userChrome.css $profile/chrome/userChrome-overrides.css
  # fi
done

