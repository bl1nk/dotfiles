#!/usr/bin/env zsh
alias gp='git push'
alias gs='git status'
GIT_LOG_FORMAT=--pretty=format:'%C(yellow)%h%C(red)%d%C(reset) - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)'
alias gl='git log -15 --decorate ${GIT_LOG_FORMAT}'
alias gll='git log --graph --abbrev-commit --decorate ${GIT_LOG_FORMAT}'
alias gpr='git pull --rebase'
