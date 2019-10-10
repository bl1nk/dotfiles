#!/usr/bin/env zsh

export KEYTIMEOUT=1

bindkey -v
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' overwrite-mode
bindkey "^[[7~" beginning-of-line # Pos1
bindkey "^[[8~" end-of-line # End
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

autoload edit-command-line
zle -N edit-command-line
bindkey -M 'emacs' '\ev' edit-command-line
bindkey -M 'vicmd' '\ev' edit-command-line

bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

