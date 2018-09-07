# source: http://bewatermyfriend.org/p/2012/003/
# Load compsys and one of its fancy modules
zmodload zsh/complist
autoload -Uz compinit
compinit

# And set some styles...
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle -e ':completion:*:approximate:*' max-errors \
       'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'

fpath=(/usr/local/share/zsh-completions $fpath)
