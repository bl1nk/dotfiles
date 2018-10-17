#!/usr/bin/env zsh
if (( $+commands[zplug-env] ))
then
    export ZPLUG_HOME=/usr/local/opt/zplug
    source $ZPLUG_HOME/init.zsh

    zplug mafredri/zsh-async, from:github
    zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme


    # Install plugins if there are plugins that have not been installed
    if ! zplug check; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load
fi
