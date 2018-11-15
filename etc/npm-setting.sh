#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    npm
echo
echo -------------------------------------------------

if type "npm" > /dev/null 2>&1; then
  if [ ! -e ~/.npm ]; then
    mkdir ~/.npm
  fi

  npm config set prefix '~/.npm'
  npm install npm --global
fi
