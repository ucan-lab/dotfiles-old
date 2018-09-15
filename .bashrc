if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Language
export LANG=ja_JP.UTF-8

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

# composer
if [ -e $HOME/.composer/vendor/bin ]; then
  export PATH=$HOME/.composer/vendor/bin:$PATH
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

# open current directory with Finder
alias f='open .'

# ggrks
alias g='ggrks'

# open all markdown files in current directory
alias md='vim ./*.md'

# phpunit
alias test='./vendor/bin/phpunit'

# open current directory with Finder
alias f='open -a Finder ./'

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
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND} - ${PWD##*/}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac
## Hyper plugin - hyper-tab-icons-plus
