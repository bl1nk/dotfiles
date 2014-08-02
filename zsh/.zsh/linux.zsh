if [[ -x `which pacman` ]]; then
    alias p='s pacman '
fi
if [[ -x `which systemctl` ]]; then
    alias sc='s systemctl '
fi

if [[ "$(hostname)" == "schoko.kuchen.io"  ]]; then
    export PATH=$PATH:~/.rbenv/bin
    eval "$(rbenv init -)"
fi

# colors in framebuffer
if [[ $TERM = "linux" ]]; then
    ${HOME}/bin/parse_xdefaults.sh
    clear #for background artifacting
fi

if [[ "`uname -s`" == "Linux" ]]; then
    # some better colors for ls
    eval "`dircolors ~/.dircolors`"

    # beep after commands
    bellchar=$'\a'
    setterm -blength 0 # Don't REALLY beep
    zle-line-init () { echo -n "$bellchar" }
    zle -N zle-line-init
fi

