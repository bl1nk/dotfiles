if test -d $HOME/.local/bin
    set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
end
if test -d /usr/local/bin
	set -g fish_user_paths /usr/local/bin $fish_user_paths
end
