#!/usr/bin/env zsh
if (( ${+commands[pass]} )); then
    alias ppr='pass git pull --rebase'

    EXTENSIONS_DIR=/usr/local/lib/password-store/extensions
    if [ -d "${EXTENSIONS_DIR}" ]; then
	    export PASSWORD_STORE_ENABLE_EXTENSIONS=true
	    export PASSWORD_STORE_EXTENSIONS_DIR=${EXTENSIONS_DIR}
    fi
fi

