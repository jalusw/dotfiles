# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=*'

# Menu selection
zstyle ':completion:*' menu select

# Verbose completion
zstyle ':completion:*' verbose yes

# Group results by type
zstyle ':completion:*' group-name ''

# Kill/ps completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
