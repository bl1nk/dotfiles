if [[ "$OSTYPE" == linux* ]]; then
    # some better colors for ls
    if [[ -x `which dircolors` ]] ; then
        eval "`dircolors ~/.dircolors`"
    fi

    # beep after commands
    bellchar=$'\a'
    if [[ -x `which setterm` ]] ; then
        setterm -blength 0 # Don't REALLY beep
    fi
    zle-line-init () { echo -n "$bellchar" }
    zle -N zle-line-init

    if [[ -x `which pacman` ]]; then
        alias p='s pacman '
    fi
    if [[ -x `which systemctl` ]]; then
        alias sc='s systemctl '
    fi
    if [[ -x `which docker` ]]; then
        alias docker-clean='docker ps -q -f status=exited | xargs --no-run-if-empty docker rm && docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi'
    fi

    if [[ "$HOST" == schoko* ]] ; then
        export PATH="$PATH:/home/markus/.gem/ruby/2.3.0/bin"
    fi

fi

