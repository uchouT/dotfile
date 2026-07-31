export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Keep Zsh's startup files in $HOME; only the modular configuration lives elsewhere.
export ZDOTDIR="$HOME"
export ZSH_CONFIG_DIR="$HOME/.config/zsh"

[[ -r "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"
[[ -r "$ZSH_CONFIG_DIR/env.local.zsh" ]] && source "$ZSH_CONFIG_DIR/env.local.zsh"
