export TERMINAL=kitty

for dir in \
  "$HOME/.TinyTeX/bin/x86_64-linux" \
  /opt/x86_64-linux-musl-cross/bin \
  /opt/riscv64-linux-musl-cross/bin
do
  [[ -d "$dir" ]] && path=("$dir" $path)
done
unset dir

if (( $+commands[kitten] )); then
  alias ks='kitten ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=3'
  alias kat='"$ZSH_CONFIG_DIR/scripts/kat.sh"'
fi

if [[ -r /usr/share/ShellCrash/menu.sh ]]; then
  export CRASHDIR=/usr/share/ShellCrash
  alias crash='bash /usr/share/ShellCrash/menu.sh'
fi
