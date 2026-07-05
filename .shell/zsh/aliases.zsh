# Navigation
alias ..="cd .."
alias -g ...="../.."
alias -g ....="../../.."

# Safety
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# File listing (eza)
alias ls="eza"
alias ll="eza -l"
alias la="eza -la"
alias lt="eza -l --sort time"

# Modern replacements
alias cat="bat"
alias top="btop"
alias grep="rg"
alias find="fd"
alias du="dust"
alias df="duf"

# Git
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph"
alias gs="git status"
alias gd="git diff"
alias gco="git checkout"

# Docker
alias dps="docker ps"
alias dpa="docker ps -a"
alias dlogs="docker logs -f"
alias dprune="docker system prune -af"

# Network
alias myip="curl -s ifconfig.me"
alias ip="ip -c"
alias ports="lsof -i -P -n | grep LISTEN"

# Quick edit
alias zshrc="$EDITOR ~/.zshrc"
alias aliases="$EDITOR ~/.shell/zsh/aliases.zsh"

# Misc
alias please="sudo"
alias fuck="sudo \$(fc -ln -1)"
alias server="python3 -m http.server"
alias serve="python3 -m http.server 8000"
