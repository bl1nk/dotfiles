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
alias gl='git log -15 --oneline --decorate'
alias gll='git log --graph --pretty=oneline --abbrev-commit --decorate'
alias glp='gll -p'
alias gpr='git pull --rebase'

alias mkdir='nocorrect mkdir'
alias wget='nocorrect noglob wget'
alias wgetc="wget --content-disposition"

