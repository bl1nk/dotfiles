if (( ${+commands[go]} )); then
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin

    if [[ ! -d ${GOPATH} ]]; then
        mkdir -p ${GOPATH}
    fi
fi
