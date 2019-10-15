#!/usr/bin/env zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
P=${0:A:h}/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ${P} ]] && source ${P}
