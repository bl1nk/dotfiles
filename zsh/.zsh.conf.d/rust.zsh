#!/usr/bin/env zsh
CARGO_BIN="${HOME}/.cargo/bin"
if [ -d ${CARGO_BIN} ]; then
    export PATH="${CARGO_BIN}:$PATH"
fi
