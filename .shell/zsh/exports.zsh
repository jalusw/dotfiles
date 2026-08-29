export EDITOR=nvim
export VISUAL="$EDITOR"
export PAGER="bat"
export MANPAGER="bat -p"
export BROWSER="firefox"
export TERMINAL="kitty"
export LANG="en_US.UTF-8"
export COLORTERM=truecolor

# Man page colors (Monochromatic)
export LESS_TERMCAP_mb=$'\e[1;38;2;255;46;154m'
export LESS_TERMCAP_md=$'\e[1;38;2;30;232;255m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;48;2;30;232;255;38;2;10;10;18m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;38;2;30;232;255m'

# Bat theme (uses terminal ANSI colors, which are themed)
export BAT_THEME="ansi"

# Monochromatic palette (reusable by other scripts)
export MONO_BG0="#0A0A12" MONO_BG1="#14141F" MONO_BG2="#1E1E2E"
export MONO_FG0="#E8E6F0" MONO_FG1="#9C9AB0" MONO_BORDER="#2A2A3D"
export MONO_PRIMARY="#CCCCCC" MONO_LIGHT="#E0E0E0"
export MONO_LIGHTER="#F0F0F0" MONO_DARK="#888888"
export MONO_DARKER="#555555" MONO_MUTED="#333333"

# Fzf (Monochromatic colors)
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse \
  --color bg:#0A0A12,preview-bg:#14141F,fg:#E8E6F0,fg+:#E8E6F0 \
  --color hl:#CCCCCC,hl+:#888888,gutter:#0A0A12 \
  --color pointer:#CCCCCC,info:#9C9AB0,spinner:#E0E0E0 \
  --color header:#CCCCCC,prompt:#888888,marker:#E0E0E0,border:#2A2A3D"
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
