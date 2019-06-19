switch (uname)
    case Darwin
        set -l BREW_GNU_COREUTILS_PATH (brew --prefix coreutils)/libexec/gnubin
        if test -d $BREW_GNU_COREUTILS_PATH
            set -g fish_user_paths $BREW_GNU_COREUTILS_PATH $fish_user_paths
        end

        set -x GPG_TTY (tty)
        alias ls='ls -Gsh'
    case OpenBSD
        set -g LC_CTYPE en_US.UTF-8
        set -g LC_MESSAGES en_US.UTF-8

        if command -sq colorls
            alias ls='colorls -GFh'
        end
        alias tmux='tmux -2 -u'
end
