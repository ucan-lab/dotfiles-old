#!/usr/bin/zsh -eu

echo -------------------------------------------------
echo
echo                    zsh and prezto init
echo
echo -------------------------------------------------

for f (.zlogin .zlogout .zpreztorc .zprofile .zshenv .zshrc) rm -f ~/$f

if [ -d ~/.zprezto ]; then
  rm -rf ~/.zprezto
fi

echo -------------------------------------------------
echo
echo                    prezto
echo
echo -------------------------------------------------

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
