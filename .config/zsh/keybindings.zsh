bindkey -e

clear-screen-and-redraw() {
  zle clear-screen
}

zle -N clear-screen-and-redraw
bindkey '^L' clear-screen-and-redraw
