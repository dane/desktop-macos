export XDG_CONFIG_HOME=~/.config
export XDG_CONFIG_DIRS=~/.config:$XDG_CONFIG_DIRS
export BUNDLE_USER_HOME=~/.config/bundle
export BUNDLE_USER_CACHE=~/.local/bundle/cache
export BUNDLE_USER_PLUGIN=~/.local/bundle/plugin
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR=vim
export KEYTIMEOUT=1
export GPG_TTY=$(tty)
export GO111MODULE=on
export GOPATH=~/Projects

path=(
  $GOPATH/bin
  $HOME/.local/bin
  /opt/homebrew/opt/ruby/bin
  /usr/local/opt/python/libexec/bin
  /usr/local/bin:/usr/local/sbin
  $path
)

cdpath=$GOPATH/src

autoload -U compinit; compinit
autoload edit-command-line

setopt NO_BEEP
setopt append_history
setopt share_history

bindkey '^Xe'   edit-command-line
bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char
bindkey -e
bindkey '^r' history-incremental-search-backward

zle -N edit-command-line
prompt="%1~%%%  "

if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -f ~/.local/zsh/zshrc ]; then
  source ~/.local/zsh/zshrc
fi

# Launch a new or attach to an existing tmux session
if [ -z "$TMUX" ]; then
  tmux attach 2> /dev/null
  if [ $? -eq 1 ]; then
    tmux
  fi
fi
