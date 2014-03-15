swap() {
	if [[ -z $1 ]] || [[ -z $2 ]] || [[ $1 = "-h" ]]; then
		echo -e "${blue}Usage:$NC swap <file> <file>";
		echo -e "Swaps files";
		return 1
	fi
	if [[ -f $1 ]] && [[ -f $2 ]]; then
		local TMPFILE=tmp.$$
		mv "$1" $TMPFILE
		mv "$2" "$1"
		mv $TMPFILE "$2"
	else
		echo -e "${RED}Error:$NC One or more files don't exist"
		return 1
	fi
}

cget() {
	curl -fJOL --compressed "$@"
}

function f() {
	q="*$1*"
	find . -iname $q
}

# zsh functions {{{
# When tab-completing, show dots. For fast tab completes, they will be
# overwritten instantly, for long tab-completions, you have feedback.
expand-or-complete-with-dots() {
	echo -n -e "${RED}...\e[0m\033[3D"
	zle expand-or-complete
	zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

precmd() {
	if [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ $TERM == ansi ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
		printf "\33]2;$USER@$HOST: ${PWD/#$HOME/~}\007" $1
	fi
}
# }}}
