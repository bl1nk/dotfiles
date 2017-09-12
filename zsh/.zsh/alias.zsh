alias sudo='sudo '
alias s='sudo '
alias v='vim '
alias ta='tmux a -t'
alias td='tmux detach'
alias g='git '

alias ls='ls -sh --color=auto'
alias l='ls -l'
alias ll='l'
alias lt='ls -tr'
alias llt='l -tr'
alias la='ls -a'
alias lla='ll -a'

alias grep='grep --color'

alias -g T="| tail"
alias -g G="| grep"
alias -g H="| head"

alias mkdir='nocorrect mkdir'
alias wget='nocorrect noglob wget'
alias wgetc="wget --content-disposition"

tm() {
    local session
    newsession=${1:-new}
    session=$(tmux list-sessions -F "#{session_name}" | \
        fzf --query="$1" --select-1 --exit-0) &&
        tmux attach-session -d -t "$session" || tmux new-session -s $newsession
}
