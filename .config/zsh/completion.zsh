# ez-compinit (loaded by Antidote) initializes completion after fpath is ready.
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select

zstyle ':plugin:ez-compinit' compstyle zshzoo
zstyle ':plugin:ez-compinit' use-cache yes
export ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION"
[[ -d "${ZSH_COMPDUMP:h}" ]] || mkdir -p -- "${ZSH_COMPDUMP:h}"
