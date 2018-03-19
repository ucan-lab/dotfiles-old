#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    ccat
echo
echo -------------------------------------------------

if ! type "ccat" > /dev/null 2>&1; then
  if [ `get_os_name` == "mac" ]; then
    brew install ccat
  fi
fi
