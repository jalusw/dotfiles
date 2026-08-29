# Load oh-my-zsh (plugins only, prompt handled by starship)
source $ZSH/oh-my-zsh.sh

# 24-bit color helpers — build escapes from the MONO_* hex vars in exports.zsh
_mono_fg() { printf '\033[38;2;%d;%d;%dm' "$((16#${1[1,2]}))" "$((16#${1[3,4]}))" "$((16#${1[5,6]}))"; }
_mono_rst() { printf '\033[0m'; }

# Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  # Minimal Monochromatic fallback prompt (24-bit, reuses exported palette)
  setopt PROMPT_SUBST
  _wfg1=$(_mono_fg "$MONO_FG1")
  _wcyan=$(_mono_fg "$MONO_PRIMARY")
  _wmint=$(_mono_fg "$MONO_LIGHT")
  _wmag=$(_mono_fg "$MONO_DARK")
  _wcoral=$(_mono_fg "$MONO_DARKER")
  _wblue=$(_mono_fg "$MONO_LIGHTER")
  _wrst=$(_mono_rst)

  PROMPT=$'%{${_wfg1}%}%n@%m %{${_wcyan}%}%~ %{${_wmint}%}$(git_prompt_info)%{${_wrst}%}\n%{${_wmag}%}❯ %{${_wrst}%}'
  RPROMPT='%{${_wcoral}%}%(?..%? )%{${_wblue}%}%D{%H:%M}%{${_wrst}%}'
fi
