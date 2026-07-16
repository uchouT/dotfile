# Compatibility entry point for environments that do not load ~/.zshenv.
zsh_config_home="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
[[ -r "$zsh_config_home/.zshrc" ]] && source "$zsh_config_home/.zshrc"
unset zsh_config_home
