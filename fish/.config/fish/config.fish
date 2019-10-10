# Install fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -gx fish_greeting ""
set -gx EDITOR vim
set -gx VISUAL vim
if command -sq nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end
set -gx PAGER less

switch (uname)
    case Darwin
        set -l brew_gnu_coreutils_path (brew --prefix coreutils)/libexec/gnubin
        if test -d $brew_gnu_coreutils_path
            set -g fish_user_paths $brew_gnu_coreutils_path $fish_user_paths
        end

        set -gx GPG_TTY (tty)
    case OpenBSD
        set -g LC_CTYPE en_US.UTF-8
        set -g LC_MESSAGES en_US.UTF-8

        if command -sq colorls
            alias ls='colorls -GFh'
        end
        alias tmux='tmux -2 -u'
end

if test -f $HOME/.config.fish.local
    source $HOME/.config.fish.local
end