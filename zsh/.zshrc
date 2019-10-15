#!/usr/bin/env zsh

# stuff & url quoting
autoload -Uz compaudit compinit url-quote-magic
zle -N self-insert url-quote-magic

# make C-w delete until /
WORDCHARS='*?_-.[]~=&!#$%^(){}<>'
export WORDCHARS

# history
setopt hist_ignore_space
setopt append_history
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt share_history
setopt hist_ignore_all_dups
setopt extendedglob
HISTFILE=~/.zhistfile
HISTSIZE=10000
SAVEHIST=500000
export HISTFILE HISTSIZE SAVEHIST

# statistics
REPORTTIME=10

# view and edit stuff
EDITOR=vim
VISUAL=vim
if (( $+commands[nvim] )); then
    EDITOR=nvim
    VISUAL=nvim
fi

PAGER=less
export EDITOR VISUAL PAGER

# default prompt
PS1='%n@%m:%~
%(!.#.$) '

PLUGINS="${HOME}/.zsh.conf.d"
if [[ -d "$PLUGINS" ]]; then
    for plugin ("${PLUGINS}"/*.zsh(r)); do
        . "${plugin}"
    done
fi

[[ -r "${HOME}/.zshrc.local" ]] && . "${HOME}/.zshrc.local"
