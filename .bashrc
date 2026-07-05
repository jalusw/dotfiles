#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Env
export EDITOR=nvim
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"
export COLORTERM=truecolor

# Paths
export HOME_BIN="$HOME/.local/bin"
export NVIM_BIN="/opt/nvim-linux-x86_64/bin"
export GO_HOME_BIN="$HOME/go/bin"
export GO_USR_BIN="/usr/local/go/bin"
export VOLTA="$HOME/.volta"
export SCRIPTS="$HOME/scripts"
export FZF_PATH="$HOME/.fzf/bin"

export PATH="$PATH:$HOME_BIN:$GO_HOME_BIN:$GO_USR_BIN:$NVIM_BIN:$VOLTA:$SCRIPTS:$FZF_PATH"

# History
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups:ignorespace

# Man page colors
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Vi mode
set -o vi

# Colors
eval "$(dircolors -b ~/.dircolors)" 2>/dev/null

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias server='python3 -m http.server'
alias serve='python3 -m http.server 8000'
alias please='sudo'
alias fuck='sudo $(fc -ln -1)'
alias ports='lsof -i -P -n | grep LISTEN'

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv &>/dev/null && eval "$(pyenv init - bash)"

# opencode
export PATH=/home/jalusw/.opencode/bin:$PATH

# Shell integrations
command -v starship &>/dev/null && eval "$(starship init bash)"
command -v atuin &>/dev/null && eval "$(atuin init bash)"
command -v direnv &>/dev/null && eval "$(direnv hook bash)"
command -v zoxide &>/dev/null && eval "$(zoxide init bash)"
command -v fzf &>/dev/null && eval "$(fzf --bash)" 2>/dev/null
