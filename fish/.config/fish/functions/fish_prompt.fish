# A lambda (λ) prompt.
# Green and red depending on exit status.
# Underlined if git status is dirty.
# Uppercase (Λ) if ahead of the remote.

function fish_mode_prompt
end

function _pwd
    set_color cyan
    # echo -n (basename (pwd | sed "s#$HOME#\~#"))
    echo -n (prompt_pwd)' '
end

function _git
    if is_git_dirty
        set_color --underline
    end
    if is_git
        set_color yellow
        echo -n (git_branch)
        set_color normal
        echo -n ' '
    end
end

function _jobs
    set jobs (job_count)
    if test $jobs -gt 0
        set_color red
        echo -n "%$jobs "
    end
end
function _mode
    switch $fish_bind_mode
        case default
            set_color magenta
            echo -n ':'
        case insert
            set_color magenta
            echo -n '$'
        case replace_one
            set_color yellow
            echo -n '$'
        case visual
            set_color blue
            echo -n '$'
        case '*'
            set_color normal
            echo -n '$'
    end
end

function _kubecontext
    if command -sq kubectx
        set_color blue
        echo -n (kubectx -c)
        set_color normal
        echo -n ' '
    end
end

function _exit_code
    if not is_status_okay
        set_color red
        echo -n '!'
    end
end

function fish_prompt
    echo
    _exit_code
    _pwd
    _git
    _kubecontext

    echo
    _jobs
    _mode

    set_color normal
    echo -n ' '
end

