#!/usr/bin/env zsh
if (( $+commands[chruby] )); then
    [ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh
    [ -f /usr/local/opt/chruby/share/chruby/auto.sh ] && source /usr/local/opt/chruby/share/chruby/auto.sh
fi