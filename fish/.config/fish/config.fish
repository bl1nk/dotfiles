if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -x EDITOR vim
set -x VISUAL vim
if command -sq nvim
    set -x EDITOR nvim
    set -x VISUAL nvim
end
set -x PAGER less

if test -d $__fish_config_dir/conf.d
    source $__fish_config_dir/conf.d/*
end

source $__fish_config_dir/os.fish