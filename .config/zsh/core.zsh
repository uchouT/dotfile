# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/i/.zshrc'
fpath+=/usr/share/zsh/site-functions
autoload -U compinit
setopt no_nomatch
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=1000
bindkey -v

function clear-screen-and-redraw() {
  zle clear-screen        # 清屏
}
zle -N clear-screen-and-redraw
bindkey '^L' clear-screen-and-redraw
bindkey -M vicmd '1' beginning-of-line  # 让 1 跳到行首
bindkey -M vicmd '0' end-of-line        # 让 0 跳到行尾

# End of lines configured by zsh-newuser-install
# 避免重复历史记录
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# 在命令执行后立即追加到历史文件（而不是退出后才写）
setopt INC_APPEND_HISTORY

# 多个终端窗口共享历史
setopt SHARE_HISTORY


# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(starship init zsh)"
  }
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/i/.config/zsh/plugin/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh
source /home/i/.config/zsh/plugin/fzf-tab/fzf-tab.plugin.zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -ahl --color=auto'
alias grep='grep --color=auto'
alias nv='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export KEYTIMEOUT=5
