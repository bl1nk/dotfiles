if [[ "$OSTYPE" == linux* ]]; then
	# some better colors for ls
	eval "`dircolors ~/.dircolors`"

	# beep after commands
	bellchar=$'\a'
	setterm -blength 0 # Don't REALLY beep
	zle-line-init () { echo -n "$bellchar" }
	zle -N zle-line-init

	if [[ -x `which pacman` ]]; then
		alias p='s pacman '
	fi
	if [[ -x `which systemctl` ]]; then
		alias sc='s systemctl '
	fi

	# colors in framebuffer
	if [[ $TERM = "linux" ]]; then
		${HOME}/bin/parse_xdefaults.sh
		clear #for background artifacting
	fi

	if [[ "$HOST" == schoko* ]] ; then
		export PATH="$PATH:/home/markus/.gem/ruby/2.3.0/bin"
	fi

fi

