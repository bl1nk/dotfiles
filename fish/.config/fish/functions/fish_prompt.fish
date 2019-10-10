function fish_prompt
    set -l last_status $status

    echo
    _status $last_status
    _pwd
    _git
    _kubecontext

    echo
    _mode
end

function _status
    if test $argv -ne 0
        set_color red
        echo -n $argv
        set_color normal
        echo -n ' '
    end
end

function _pwd
    set_color -o cyan
    # echo -n (basename (pwd | sed "s#$HOME#\~#"))
    echo -n (prompt_pwd)
    set_color normal
    echo -n ' '
end

function _git
    if is_git_dirty
        set_color --underline
    end
    if is_git
        set_color green
        echo -n (git_branch)
        set_color normal
        echo -n ' '
    end
end

function _mode
    set -l char
    set -l color
    switch $fish_bind_mode
        case default
            set color magenta
            set char ':'
        case insert
            set color magenta
            set char '$'
        case replace_one
            set color yellow
            set char ':'
        case visual
            set color blue
            set char ':'
        case '*'
            set color normal
            set char '$'
    end
    set_color $color
    echo -n $char
    set_color normal
    echo -n ' '
end

function _kubecontext
    if command -sq kubectx
        set_color 777
        echo -n (kubectx -c)
        set_color normal
        echo -n ' '
    end
end
