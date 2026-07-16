[[ -o interactive ]] || return

typeset -gr ZSH_CONFIG_DIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"

source_zsh_config() {
  [[ -r "$ZSH_CONFIG_DIR/$1" ]] && source "$ZSH_CONFIG_DIR/$1"
}

source_zsh_config options.zsh
source_zsh_config history.zsh
source_zsh_config completion.zsh
source_zsh_config keybindings.zsh
source_zsh_config aliases.zsh
source_zsh_config tools.zsh

profile="${ZSH_PROFILE:-server}"
source_zsh_config "profiles/$profile.zsh"
unset profile

# Machine-specific interactive settings and widgets must load before plugins.
source_zsh_config local.zsh

# A child shell may inherit paths already added by its parent.
typeset -U path PATH
path=($path)

# Antidote deliberately loads last. zsh-syntax-highlighting is the final plugin.
source_zsh_config plugins.zsh

unfunction source_zsh_config
