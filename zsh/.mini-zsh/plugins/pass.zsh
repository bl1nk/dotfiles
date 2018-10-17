#!/usr/bin/env zsh
if (( $+commands[pass] ))
then
    alias ppr='pass git pull --rebase'
fi

