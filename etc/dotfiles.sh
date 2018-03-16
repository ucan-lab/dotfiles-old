#!/bin/bash -eu

echo -------------------------------------------------
echo
echo                    dotfiles
echo
echo -------------------------------------------------

cd ~/dotfiles

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  ln -sf ~/dotfiles/$f ~/$f
done
