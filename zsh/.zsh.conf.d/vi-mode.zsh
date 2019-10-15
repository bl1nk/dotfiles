#!/usr/bin/env zsh
export KEYTIMEOUT=1
bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# edit command line with opt-e
bindkey -M vicmd '\ee' edit-command-line
bindkey -M viins '\ee' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r and ctrl-s to search the history
# bindkey '^r' history-incremental-search-backward
# bindkey '^s' history-incremental-search-forward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# exit insert mode with jk or fd
bindkey -M 'viins' 'jk' vi-cmd-mode
bindkey -M 'viins' 'fd' vi-cmd-mode
