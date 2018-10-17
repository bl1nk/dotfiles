#!/usr/bin/env zsh

if (( $+commands[exa] ))
then
    alias ls='exa'
    alias ll='exa -l'
    alias la='exa -a'
    alias lla='exa -la'
fi

