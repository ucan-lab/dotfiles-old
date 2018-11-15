#
# Executes commands at the start of an interactive session.
#

# History
HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# Language
export LANG=ja_JP.UTF-8

# Show ssh username and hostname
SSH_CONNECTION=1

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  . "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

# less
if type "source-highlight" > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# nodebrew
if type "nodebrew" > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# npm global path
if [ -e $HOME/.npm/bin ]; then
  export PATH=$HOME/.npm/bin:$PATH
fi

# composer
if [ -e $HOME/.composer/vendor/bin ]; then
  export PATH=$HOME/.composer/vendor/bin:$PATH
fi

# knu/z
. ~/dotfiles/z/z.sh

##
# alias
#

alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias relogin='exec $SHELL -l'

if [[ $(uname) == 'Darwin' ]]; then
  alias ll='ls  -lhGT'
  alias la='ls -alhGT'
else
  alias ll='ls  -lh --time-style=long-iso --color=auto'
  alias la='ls -alh --time-style=long-iso --color=auto'
fi

# colordiff
if type "colordiff" > /dev/null 2>&1; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# micro
if type "micro" > /dev/null 2>&1; then
  alias mi='micro'
fi

# ccat
if type "ccat" > /dev/null 2>&1; then
  alias cat='ccat'
fi

# z command to j
alias j='z'

# open current directory with Finder
alias f='open .'

# ggrks
alias g='ggrks'

# open all markdown files in current directory
alias md='vim ./*.md'

# phpunit
alias test='./vendor/bin/phpunit'

# function
# cd to the path of the front Finder window
cdf() {
  target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
  if [ "$target" != "" ]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}

calc() {
  [ $# -ge 1 ] && echo "scale=5; $1" | bc
}

# google search
ggrks() {
  open "https://www.google.co.jp/search?q=$*";
}

## Hyper plugin - hyper-tab-icons-plus

# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
tabtitle_precmd() {
   if overridden; then return; fi
   pwd=$(pwd) # Store full path as variable
   cwd=${pwd##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}
[[ -z $precmd_functions ]] && precmd_functions=()
precmd_functions=($precmd_functions tabtitle_precmd)

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
tabtitle_preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
[[ -z $preexec_functions ]] && preexec_functions=()
preexec_functions=($preexec_functions tabtitle_preexec)

## Hyper plugin - hyper-tab-icons-plus
