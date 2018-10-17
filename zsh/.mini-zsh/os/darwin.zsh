#!/usr/bin/env zsh

export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# gnu coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

alias mosh="LC_CTYPE=en_US.UTF-8 LC_MESSAGES=en_US.UTF-8 mosh"

# correct colors for ls
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls='ls -Gsh'
