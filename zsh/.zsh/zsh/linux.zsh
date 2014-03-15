if [[ -x `which pacman` ]]; then
	alias p='s pacman '
fi
if [[ -x `which systemctl` ]]; then
	alias sc='s systemctl '
fi

# beep after commands
bellchar=$'\a'
setterm -blength 0 # Don't REALLY beep
zle-line-init () { echo -n "$bellchar" }
zle -N zle-line-init

# colors in framebuffer
if [[ $TERM = "linux" ]]; then
	${HOME}/bin/parse_xdefaults.sh
	clear #for background artifacting
fi

# some better colors for ls
if [[ "`uname -s`" == "Linux" ]]; then
	eval "`dircolors ~/.dircolors`"
fi
