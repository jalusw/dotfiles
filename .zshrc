export ZSH="$HOME/.oh-my-zsh"
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
export FZF_PATH="$HOME/.fzf/bin"

export PATH="$PATH:$HOME_BIN:$GO_HOME:$GO_USR:$NVIM_BIN:$VOLTA:$SCRIPTS:$FZF_PATH"

ZSH_THEME="lambda"

plugins=(
  git
  ssh
  fzf
  tmux
  docker
  zoxide
  debian
  archlinux
  common-aliases
)

source $ZSH/oh-my-zsh.sh

alias server="python3 -m http.server"

alias please="sudo"
alias fuck="sudo \$(fc -ln -1)"

alias serve="python3 -m http.server 8000"
alias ports="lsof -i -P -n | grep LISTEN"


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - zsh)"
eval "$(dircolors -b ~/.dircolors)"