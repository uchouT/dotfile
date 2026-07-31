export ANTIDOTE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}/antidote"

zstyle ':antidote:bundle' file "$ZSH_CONFIG_DIR/.zsh_plugins.txt"
zstyle ':antidote:static' file "$ZSH_CONFIG_DIR/.zsh_plugins.zsh"
zstyle ':plugin:ez-compinit' compstyle zshzoo

for antidote_script in \
  /usr/share/zsh-antidote/antidote.zsh \
  "${XDG_DATA_HOME:-$HOME/.local/share}/zsh/antidote/antidote.zsh"
do
  [[ -r "$antidote_script" ]] || continue
  source "$antidote_script"
  antidote load
  break
done

unset antidote_script
