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

if test -r $HOME/.fish.local
    source $HOME/.fish.local
end
