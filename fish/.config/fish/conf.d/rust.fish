if command -sq cargo
    set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
end