if [[ "$OSTYPE" == darwin* ]]; then
    export HOMEBREW_NO_ANALYTICS=1
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
    export PATH=$PATH:/usr/local/opt/ruby/bin
    export LC_ALL="en_US.UTF-8"
    export EDITOR="vim"
    export VISUAL="vim"

    alias ls="ls -Gsh"
    alias lt="ls -tcr"
    alias llt="l -tcr"
    alias q="qlmanage -p $@ >/dev/null 2>&1"
    alias mosh="LANG=en_US.UTF-8 mosh"
fi

if [[ "$HOST" == andromeda ]]; then
    export PATH=$PATH:$HOME/mytaxi/ssh-scripts
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

    alias sp="speedtest-cli --share --simple"
    alias fwfuck="sudo pfctl -d"
    alias tg="terragrunt"
fi
