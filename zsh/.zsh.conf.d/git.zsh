#!/usr/bin/env zsh
alias gp='git push'
alias gs='git status'
GIT_LOG_FORMAT=--pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset'
alias gl='git log -15 --decorate ${GIT_LOG_FORMAT}'
alias gll='git log --graph --abbrev-commit --decorate ${GIT_LOG_FORMAT}'
alias gpr='git pull --rebase'
