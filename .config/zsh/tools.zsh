if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
else
  PROMPT='%n@%m:%~%# '
fi

dart_completion="$HOME/.dart-cli-completion/zsh-config.zsh"
[[ -r "$dart_completion" ]] && source "$dart_completion"
unset dart_completion
