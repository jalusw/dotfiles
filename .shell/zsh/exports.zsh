export EDITOR=nvim
export VISUAL="$EDITOR"
export PAGER="bat"
export MANPAGER="bat -p"
export BROWSER="firefox"
export TERMINAL="kitty"
export LANG="en_US.UTF-8"
export COLORTERM=truecolor

# Man page colors
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Bat theme (Rosé Pine)
export BAT_THEME="Rosé Pine"

# Fzf (Rosé Pine colors)
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --inline-info \
  --color bg:#191724,preview-bg:#1f1d2e,fg:#e0def4,fg+:#e0def4 \
  --color hl:#ebbcba,hl+:#f6c177,gutter:#191724 \
  --color pointer:#c4a7e7,info:#908caa,spinner:#eb6f92 \
  --color header:#eb6f92,prompt:#c4a7e7,marker:#9ccfd8,border:#403d52"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Dircolors
eval "$(dircolors -b ~/.dircolors)"

# Zsh options
setopt autocd              # cd by typing dir name
setopt extendedglob        # enable extended globbing
setopt interactivecomments # allow comments in interactive shell
setopt notify              # report bg job status immediately
setopt auto_pushd          # push dir to stack on cd
setopt pushd_ignore_dups   # no duplicates in dir stack
setopt list_packed         # compact completion lists
setopt no_beep             # disable beeps
setopt menucomplete        # tab complete with menu
setopt correct             # suggest command corrections
