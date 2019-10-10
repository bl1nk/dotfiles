if command -sq cargo
    set -l cargo_bin_dir "$HOME/.cargo/bin"
    if test -d $cargo_bin_dir
        set -g fish_user_paths $cargo_bin_dir $fish_user_paths
    end
end