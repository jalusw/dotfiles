export HOME_BIN="$HOME/.local/bin"
export NVIM_BIN="/opt/nvim-linux-x86_64/bin"
export GO_HOME_BIN="$HOME/go/bin"
export GO_USR_BIN="/usr/local/go/bin"
export VOLTA="$HOME/.volta"
export SCRIPTS="$HOME/scripts"
export FZF_PATH="$HOME/.fzf/bin"
export OPENCODE_PATH="$HOME/.opencode/bin"
export ANDROID_HOME=$HOME/Android/Sdk

typeset -U PATH path
path=(
  $HOME_BIN
  $GO_HOME_BIN
  $GO_USR_BIN
  $NVIM_BIN
  $VOLTA
  $SCRIPTS
  $FZF_PATH
  $OPENCODE_PATH
  $ANDROID_HOME/platform-tools
  $path
)
