#!/bin/bash -eu

source etc/get_os.sh
source etc/brew.sh
source etc/grc.sh
source etc/source-highlight.sh
source etc/zsh.sh
if type "zsh" > /dev/null 2>&1
then
  `which zsh` etc/zsh_prezto.sh
fi
source etc/npm-setting.sh

echo -------------------------------------------------
echo
echo                    dotfiles
echo
echo -------------------------------------------------

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  ln -sf ~/dotfiles/$f ~/$f
done

source etc/vim.sh

echo -------------------------------------------------
echo
echo                    Success Complete !!!
echo
echo -------------------------------------------------
