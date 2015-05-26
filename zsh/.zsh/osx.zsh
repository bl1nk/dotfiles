if [[ "$OSTYPE" == darwin* ]]; then
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
    export PATH=$PATH:/usr/local/opt/ruby/bin

    export LC_ALL="en_US.UTF-8"
    export EDITOR="nvim"
    export VISUAL="nvim"

    alias ls="ls -Gsh"
    alias lt="ls -tcr"
    alias llt="l -tcr"
    alias q="qlmanage -p $@ >/dev/null 2>&1"
    alias mosh="LANG=en_US.UTF-8 mosh"
    alias vim="nvim"
    alias bubu="brew update && brew upgrade --all"

    twitch() { livestreamer --player 'mpv --cache 256' http://www.twitch.tv/$1 source; }
fi

if [[ "$HOST" == myt-* ]]; then
    export PATH=$PATH:$HOME/Git/ssh-scripts/
fi
