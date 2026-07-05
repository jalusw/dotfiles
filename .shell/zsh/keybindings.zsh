# Vi mode
bindkey -v

# Reduce escape mode delay (ms)
export KEYTIMEOUT=1

# Insert mode bindings
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^p' up-history
bindkey -M viins '^n' down-history
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^l' clear-screen

# Ctrl+left/right for word navigation
bindkey -M viins '^[[1;5D' backward-word
bindkey -M viins '^[[1;5C' forward-word

# Home/End
bindkey -M viins '^[[H' beginning-of-line
bindkey -M viins '^[[F' end-of-line
