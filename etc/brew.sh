#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    homebrew
echo
echo -------------------------------------------------

if [ `get_os_name` == "mac" ]; then
  if ! type "brew" > /dev/null 2>&1; then
    echo "homebrew install"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
fi
