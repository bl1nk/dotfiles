alias ls='ls -sh --color=auto'
alias ll='ls -lF'
alias la='ls -a'
alias lla='ll -a'

alias sudo='sudo '

alias tm="tmux -u attach -d || tmux -u"
alias td='tmux detach'

alias v='vim '

alias gco='git checkout'
alias gp='git push'
alias gs='git status'
GIT_LOG_FORMAT=--pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset'
alias gl='git log -15 --decorate ${GIT_LOG_FORMAT}'
alias gll='git log --graph --abbrev-commit --decorate ${GIT_LOG_FORMAT}'
alias glp='gll -p'
alias gpr='git pull --rebase'

alias mkdir='nocorrect mkdir'
alias wget='nocorrect noglob wget'
alias wgetc="wget --content-disposition"

