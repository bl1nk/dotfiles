#!/usr/bin/env zsh

if (( $+commands[cargo] ))
then
    export PATH="$HOME/.cargo/bin:$PATH"
fi