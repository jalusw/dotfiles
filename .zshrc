export ZSH="$HOME/.oh-my-zsh"

# Directory of this .zshrc file (resolves symlinks)
DOTFILES="${${(%):-%x}:A:h}"

# Source modular config files
for module in path exports language plugins prompt history completion keybindings aliases functions ssh utils; do
  source "$DOTFILES/.shell/zsh/$module.zsh"
done
