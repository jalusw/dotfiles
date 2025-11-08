PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias server="python3 -m http.server"

alias d="docker"
alias dps="docker ps"
alias di="docker images"
alias dbash="docker exec -it"
alias drm="docker rm"
alias dstop="docker stop"

alias txx="tmux kill-server"
alias txs="tmux list-sessions"
alias txa="tmux attach-session"

alias please="sudo"
alias fuck="sudo $(fc -ln -1)"

alias serve="python3 -m http.server 8000"
alias ports="lsof -i -P -n | grep LISTEN"

export EDITOR=nvim
export LANG="en_US.UTF-8"
export VISUAL="$EDITOR"
export COLORTERM=truecolor

export HOME_BIN="$HOME/.local/bin"
export NVIM_BIN="/opt/nvim-linux-x86_64/bin"
export GO_HOME_BIN="$HOME/go/bin"
export GO_USR_BIN="/usr/local/go/bin"
export VOLTA="$HOME/.volta"
export SCRIPTS="$HOME/scripts"

export PATH="$PATH:$HOME_BIN:$GO_HOME_BIN:$GO_USR_BIN:$NVIM_BIN:$VOLTA:$SCRIPTS"

export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(dircolors -b ~/.dircolors)"
