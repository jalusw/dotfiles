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

alias sup="sudo apt update && sudo apt upgrade -y"
alias serve="python3 -m http.server 8000"
alias ports="lsof -i -P -n | grep LISTEN"

export EDITOR=nvim

export PATH="$HOME/go/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:$HOME/.volta"

export PYENV_ROOT="$HOME/.pyenv"
[ -d "$PYENV_ROOT/bin" ] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(dircolors -b ~/.dircolors)"
