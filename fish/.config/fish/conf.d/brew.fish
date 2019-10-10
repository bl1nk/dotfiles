if command -sq brew
    set -gx HOMEBREW_NO_ANALYTICS 1

    set -l brew_gnu_coreutils_path (brew --prefix coreutils)/libexec/gnubin
    if test -d $brew_gnu_coreutils_path
        set -g fish_user_paths $brew_gnu_coreutils_path $fish_user_paths
    end
end
