# Load oh-my-zsh (plugins only, prompt handled by starship)
source $ZSH/oh-my-zsh.sh

# Starship prompt
command -v starship &>/dev/null && eval "$(starship init zsh)"
