#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    npm
echo
echo -------------------------------------------------

if type "npm" > /dev/null 2>&1; then
  if [ ! -e ~/.npm-global ]; then
    mkdir ~/.npm-global
  fi

  npm config set prefix '~/.npm-global'
fi
