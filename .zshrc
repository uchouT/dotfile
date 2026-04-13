source "/home/i/.config/zsh/core.zsh"

export TERMINAL=kitty
export PATH="$PATH:/home/i/.local/bin"
export PATH=$HOME/bin:$HOME/.TinyTeX/bin/x86_64-linux:$PATH
alias ks="kitten ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=3"
alias kat="~/.config/zsh/scripts/kat.sh"

export MANPAGER="nvim +Man!"

alias docker=podman
## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/i/.dart-cli-completion/zsh-config.zsh ]] && . /home/i/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


export PATH=/opt/x86_64-linux-musl-cross/bin:$PATH
export PATH=/opt/riscv64-linux-musl-cross/bin:$PATH
alias sudo="sudo "
export PATH="$HOME/.npm-global/bin:$PATH"
