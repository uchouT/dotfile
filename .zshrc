# Compatibility fallback for environments that skip ~/.zshenv.
export ZSH_CONFIG_DIR="$HOME/.config/zsh"
[[ -r "$ZSH_CONFIG_DIR/.zshrc" ]] && source "$ZSH_CONFIG_DIR/.zshrc"
