#!/usr/bin/env zsh

FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND FZF_CTRL_T_COMMAND FZF_ALT_C_COMMAND FZF_DEFAULT_OPTS FZF_CTRL_R_OPTS FZF_CTRL_T_OPTS

if (( ${+commands[fd]} )); then
    export FZF_DEFAULT_COMMAND='fd --type f'
fi

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh