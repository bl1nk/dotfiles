if command -sq pass
    set -l BREW_PASS_EXTENSION_DIR
    if test -d $BREW_PASS_EXTENSION_DIR
        set -x PASSWORD_STORE_ENABLE_EXTENSIONS true
	    set -x PASSWORD_STORE_EXTENSIONS_DIR $BREW_PASS_EXTENSION_DIR
    end
end