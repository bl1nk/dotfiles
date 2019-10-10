if command -sq pyenv
    status --is-interactive; and source (pyenv init -|psub)
end