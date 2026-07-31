typeset -U path PATH

# Add only directories that exist. The final order favors user-local tools.
for dir in \
  "$HOME/bin" \
  "$HOME/.cargo/bin" \
  "$HOME/.npm-global/bin" \
  "$HOME/.local/bin" \
  "$HOME/.local/share/nvim/mason/bin"
do
  [[ -d "$dir" ]] && path=("$dir" $path)
done
unset dir

if [[ -z ${EDITOR:-} ]]; then
  if (( $+commands[nvim] )); then
    export EDITOR=nvim
  else
    export EDITOR=vi
  fi
fi

export VISUAL="${VISUAL:-$EDITOR}"

if [[ -z ${MANPAGER:-} ]]; then
  if (( $+commands[nvim] )); then
    export MANPAGER='nvim +Man!'
  else
    export MANPAGER='less -R'
  fi
fi
