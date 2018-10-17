#!/usr/bin/env zsh
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
