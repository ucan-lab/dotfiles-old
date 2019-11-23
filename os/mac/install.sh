#!/bin/bash -eu

cd `dirname $0`

echo -------------------------------------------------
echo
echo                    homebrew
echo
echo -------------------------------------------------

if ! type "brew" > /dev/null 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -------------------------------------------------
echo
echo                    homebrew update and upgrade
echo
echo -------------------------------------------------

brew update
brew upgrade

echo -------------------------------------------------
echo
echo                    git
echo
echo -------------------------------------------------

brew install git

# ~/.gitconfig
git config --global diff.compactionHeuristic true
git config --global core.ignorecase false # ファイル名の大文字・小文字の変更を検知する
git config --global core.quotepath false # 日本語ファイル名をエスケープせずに表示
git config --global color.ui true # カラー設定
git config --global color.diff auto # カラー設定
git config --global color.status auto # カラー設定
git config --global color.branch auto # カラー設定
git config --global pager.log "(diff-highlight 2>/dev/null || cat) | ${PAGER:-less}"
git config --global pager.show "(diff-highlight 2>/dev/null || cat) | ${PAGER:-less}"
git config --global pager.diff "(diff-highlight 2>/dev/null || cat) | ${PAGER:-less}"
git config --global interactive.diffFilter "(diff-highlight 2>/dev/null || cat)"

echo -------------------------------------------------
echo
echo                    diff-highlight
echo
echo -------------------------------------------------

if [ -f /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ]; then
  ln -sfn /usr/local/share/git-core/contrib/diff-highlight/diff-highlight ~/dotfiles/bin/diff-highlight
fi

echo -------------------------------------------------
echo
echo                    bat
echo
echo -------------------------------------------------

brew install bat

echo -------------------------------------------------
echo
echo                    ripgrep
echo
echo -------------------------------------------------

brew install ripgrep

echo -------------------------------------------------
echo
echo                    grc
echo
echo -------------------------------------------------

if ! type "grc" > /dev/null 2>&1; then
  brew install grc
fi

echo -------------------------------------------------
echo
echo                    colordiff
echo
echo -------------------------------------------------

if ! type "colordiff" > /dev/null 2>&1; then
  brew install colordiff
fi

echo -------------------------------------------------
echo
echo                    source-highlight
echo
echo -------------------------------------------------

if ! type "source-highlight" > /dev/null 2>&1; then
  brew install source-highlight
fi

echo -------------------------------------------------
echo
echo                    bash-completion, git-prompt.sh
echo
echo -------------------------------------------------

brew install bash-completion
curl -o $(brew --prefix)/etc/bash_completion.d/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o $(brew --prefix)/etc/bash_completion.d/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

echo -------------------------------------------------
echo
echo                    nodenv
echo
echo -------------------------------------------------

if ! type "nodenv" > /dev/null 2>&1; then
  brew install nodenv
  eval "$(nodenv init -)"
fi

echo -------------------------------------------------
echo
echo                    tmux
echo
echo -------------------------------------------------

if ! type "tmux" > /dev/null 2>&1; then
  brew install tmux reattach-to-user-namespace
fi

echo -------------------------------------------------
echo
echo                    nodenv
echo
echo -------------------------------------------------

if ! type "nodenv" > /dev/null 2>&1; then
  brew install nodenv
fi

echo -------------------------------------------------
echo
echo                    dotfiles
echo
echo -------------------------------------------------

. ~/dotfiles/os/common/dotfiles.sh

echo -------------------------------------------------
echo
echo                    fzf
echo
echo -------------------------------------------------

if ! type "fzf" > /dev/null 2>&1; then
  brew install fzf
  $(brew --prefix)/opt/fzf/install
fi

echo -------------------------------------------------
echo
echo                    enhancd
echo
echo -------------------------------------------------

rm -rf ~/.enhancd
git clone git@github.com:b4b4r07/enhancd.git ~/.enhancd

echo -------------------------------------------------
echo
echo                    hstr
echo
echo -------------------------------------------------

if ! type "hstr" > /dev/null 2>&1; then
  brew install hstr
fi

echo -------------------------------------------------
echo
echo                    vim
echo
echo -------------------------------------------------

if ! type "vim" > /dev/null 2>&1; then
  brew install vim
fi

echo -------------------------------------------------
echo
echo                    Vundle
echo
echo -------------------------------------------------

rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
