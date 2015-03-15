export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

if [[ "$OSTYPE" == darwin* ]]; then
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
    export PATH=$PATH:/usr/local/opt/ruby/bin
    export PATH=$PATH:/usr/local/Cellar/go/1.2.1/libexec/bin
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    . $HOME/perl5/perlbrew/etc/bashrc

    export LC_ALL="en_US.UTF-8"

    alias ls="ls -Gsh"
    alias lt="ls -tcr"
    alias llt="l -tcr"
    alias q="qlmanage -p $@ >/dev/null 2>&1"
    alias mosh="LANG=en_US.UTF-8 mosh"
    alias vim="nvim"

    twitch() { livestreamer --player 'mpv --cache 256' http://www.twitch.tv/$1 source; }
fi
