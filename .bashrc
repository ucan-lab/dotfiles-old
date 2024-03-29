if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f ~/.prompt ]; then
  . ~/.prompt
fi

if [ -f ~/.alias ]; then
  . ~/.alias
fi

if [ -f ~/.function ]; then
  . ~/.function
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/.fzf.bash ]; then
  . ~/.fzf.bash
fi

if [ -f ~/.enhancd/init.sh ]; then
  . ~/.enhancd/init.sh
fi

if [ -f ~/.hstr ]; then
  . ~/.hstr
fi

if [ -f ~/dotfiles/z/z.sh ]; then
  . ~/dotfiles/z/z.sh
fi

# History
export HISTFILESIZE=50000
export HISTSIZE=${HISTFILESIZE}
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# Language
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# Color
export LSCOLORS=gxfxcxdxbxegexabagacad

# "The default interactive shell is now zsh." message suppression.
export BASH_SILENCE_DEPRECATION_WARNING=1

# less
if [[ -x `which source-highlight` ]]; then
  export LESS='-g -i -M -R -S -W -z-4 -x4'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
fi

# nodenv
if type "nodenv" > /dev/null 2>&1; then
  eval "$(nodenv init -)"
  export PATH=$HOME/.npm/bin:$PATH
fi

# homebrew
if [ -e $(brew --prefix)/bin ]; then
  export PATH=$(brew --prefix)/bin:$PATH
fi

# composer
if [ -e $HOME/.composer/vendor/bin ]; then
  export PATH=$HOME/.composer/vendor/bin:$PATH
fi

# Rust
if [ -e $HOME/.cargo/bin ]; then
  export PATH=$HOME/.cargo/bin:$PATH
fi

# dotfiles/bin
if [ -e $HOME/dotfiles/bin ]; then
  export PATH=$HOME/dotfiles/bin:$PATH
fi

# Google Cloud
## The next line updates PATH for the Google Cloud SDK.
if [ -f '~/google-cloud-sdk/path.bash.inc' ]; then . '~/google-cloud-sdk/path.bash.inc'; fi
## The next line enables shell command completion for gcloud.
if [ -f '~/google-cloud-sdk/completion.bash.inc' ]; then . '~/google-cloud-sdk/completion.bash.inc'; fi

# Hyper plugin - hyper-tab-icons-plus
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

# tmux auto start
if [[ ! -n $TMUX ]]; then
  if [[ -z `tmux list-sessions` ]]; then
    tmux new-session
  fi

  create_new_session="CreateNewSession"
  ID=$((echo $create_new_session && tmux list-sessions -F "#{session_name} #{window_index} #{window_panes} #{pane_current_path}") | fzf --query="$1" --select-1 --exit-0 | awk '{ print $1 }')
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    : # Start terminal normally
  fi
fi
