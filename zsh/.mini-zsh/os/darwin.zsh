#!/usr/bin/env zsh

export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# gnu coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

alias mosh="LC_CTYPE=en_US.UTF-8 LC_MESSAGES=en_US.UTF-8 mosh"

# correct colors for ls
export LS_COLORS="$LS_COLORS:ow=1;7;34:st=30;44:su=30;41"
alias ls='ls -Gsh'
