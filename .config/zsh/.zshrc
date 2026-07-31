[[ -o interactive ]] || return

typeset -gx ZSH_CONFIG_DIR="$HOME/.config/zsh"

setopt NO_NOMATCH
export KEYTIMEOUT=5

# Keep history in XDG state and share it between interactive shells.
typeset -g HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
typeset -g HISTSIZE=50000
typeset -g SAVEHIST=50000

[[ -d "${HISTFILE:h}" ]] || mkdir -p -- "${HISTFILE:h}"

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

bindkey -e

source "$ZSH_CONFIG_DIR/aliases.zsh"

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
else
  PROMPT='%n@%m:%~%# '
fi

# Machine-specific interactive settings and widgets must load before plugins.
[[ -r "$ZSH_CONFIG_DIR/local.zsh" ]] && source "$ZSH_CONFIG_DIR/local.zsh"

# A child shell may inherit paths already added by its parent.
typeset -U path PATH
path=($path)

# Antidote deliberately loads last. zsh-syntax-highlighting is the final plugin.
source "$ZSH_CONFIG_DIR/plugins.zsh"
