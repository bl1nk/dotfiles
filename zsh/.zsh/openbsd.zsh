if [[ "$OSTYPE" == openbsd* ]]; then
	alias ls='colorls -GFh'
    alias tmux='tmux -u'
	LANG="en_US.UTF-8"
fi
