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
    zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

    if ! zplug check; then
        printf "Install plugins with zplug? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load
fi
