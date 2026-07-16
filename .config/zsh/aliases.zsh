alias nv='nvim'
alias sudo='sudo '
alias dotfiles='git --git-dir="$HOME/.cfg" --work-tree="$HOME"'
alias config=dotfiles

if [[ "$OSTYPE" == linux* ]]; then
  alias ls='ls --color=auto'
  alias ll='ls -ahl --color=auto'
  alias grep='grep --color=auto'
fi

if (( ! $+commands[docker] && $+commands[podman] )); then
  alias docker=podman
fi
