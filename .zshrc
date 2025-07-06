source "/home/i/.config/zsh/core.zsh"

export TERMINAL=kitty
export PATH="$PATH:/home/i/.local/bin"
export PATH=$HOME/bin:$HOME/.TinyTeX/bin/x86_64-linux:$PATH
alias ks="kitten ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=3"
alias kat="~/.config/zsh/scripts/kat.sh"
