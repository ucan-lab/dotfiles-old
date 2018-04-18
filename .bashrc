if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# less
if [[ -x `which source-highlight` ]]; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# nodebrew
if type "nodebrew" > /dev/null 2>&1; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# npm global path
if [ -e $HOME/.npm-global/bin ]; then
  export PATH=$HOME/.npm-global/bin:$PATH
fi

##
# alias
#

alias ..='cd ..'
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
