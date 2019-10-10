if command -sq pass
    set -l brew_pass_extension_dir /usr/local/lib/password-store/extensions
    if test -d $brew_pass_extension_dir
        set -gx PASSWORD_STORE_ENABLE_EXTENSIONS true
        set -gx PASSWORD_STORE_EXTENSIONS_DIR $brew_pass_extension_dir
    end
end