#!/usr/bin/env zsh

# autoload -U colors && colors
# autoload -Uz vcs_info

# zstyle ':vcs_info:*' enable git
# precmd() { vcs_info }

# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats "%b%m%u%c"

# precmd() {
#     psvar=()

#     vcs_info
#     [[ -n $vcs_info_msg_0_ ]] && print -v 'psvar[1]' -Pr -- "$vcs_info_msg_0_ "
# }

# kube() {
#     if test -d $HOME/.kube/config && test $commands[kubectl] ; then
#         printf '%s' $(kubectl config current-context)
#     fi
# }

# PS1="%{$fg[white]%}
# %(1v.%1v.)$(kubectx -c)
# %{$reset_color%}%n%{$fg[white]%}@%{$reset_color%}%m%{$fg[white]%}:%{$reset_color%}%~%{$fg[green]%}%(!.#.>)%{$reset_color%} "

P=${0:A:h}/powerlevel10k/powerlevel10k.zsh-theme
[ -f ${P} ] && source ${P}
