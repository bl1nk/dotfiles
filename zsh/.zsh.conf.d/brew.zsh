#!/usr/bin/env zsh
if (( ${+commands[brew]} )); then
    export HOMEBREW_NO_ANALYTICS=1
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    export FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi