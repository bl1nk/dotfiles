#!/usr/bin/env zsh
MACOS_ZPLUG_DIR="/usr/local/opt/zplug"
HOME_ZPLUG_DIR="$HOME/.zplug"
if [ -d "${MACOS_ZPLUG_DIR}" ]; then
    ZPLUG_HOME=${MACOS_ZPLUG_DIR}
elif [ -d "${HOME_ZPLUG_DIR}" ]; then
    ZPLUG_HOME=${HOME_ZPLUG_DIR}
fi

if ((${#ZPLUG_HOME[@]})); then
    export ZPLUG_HOME
    source $ZPLUG_HOME/init.zsh

    zplug mafredri/zsh-async, from:github
    zplug "agkozak/agkozak-zsh-prompt"

    if ! zplug check; then
        printf "Install plugins with zplug? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    AGKOZAK_CUSTOM_PROMPT='%(?..%B%F{red}(%?%)%f%b )'
    AGKOZAK_CUSTOM_PROMPT+='%(!.%S%B.%B%F{green})%n%1v%(!.%b%s.%f%b) '
    AGKOZAK_CUSTOM_PROMPT+=$'%B%F{blue}%2v%f%b'
    AGKOZAK_CUSTOM_PROMPT+=$'%(3V.%F{yellow}%3v%f.)\n'
    AGKOZAK_CUSTOM_PROMPT+='$(_agkozak_vi_mode_indicator) '

    AGKOZAK_CUSTOM_RPROMPT=''

    # Then, source plugins and add commands to $PATH
    zplug load
fi
