if [[ "$OSTYPE" == darwin* ]]; then
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
    export PATH=$PATH:/usr/local/opt/ruby/bin

    export LC_ALL="en_US.UTF-8"
    export EDITOR="nvim"
    export VISUAL="nvim"
    export HOMEBREW_NO_ANALYTICS=1

    alias ls="ls -Gsh"
    alias lt="ls -tcr"
    alias llt="l -tcr"
    alias q="qlmanage -p $@ >/dev/null 2>&1"
    alias mosh="LANG=en_US.UTF-8 mosh"
    alias vim="nvim"
    alias bubu="brew update && brew upgrade"

    twitch() { livestreamer --player 'mpv --cache 256' http://www.twitch.tv/$1 source; }
fi

if [[ "$HOST" == myt-* ]]; then
    export PATH=$PATH:$HOME/Git/work/ssh-scripts
    #if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
    #export PYENV_ROOT=/usr/local/var/pyenv
    export NVIM_TUI_ENABLE_TRUE_COLOR=1

    alias sp="speedtest-cli --share --simple"
    alias fwfuck="sudo pfctl -d"
    pv() { source $HOME/.venv/$1/bin/activate ; }
    alias dup="docker-machine start"
    alias ddown="docker-machine stop"
fi
