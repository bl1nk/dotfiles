swap() {
    if [[ -z $1 ]] || [[ -z $2 ]] || [[ $1 = "-h" ]]; then
        echo -e "${blue}Usage:$NC swap <file> <file>";
        echo -e "Swaps files";
        return 1
    fi
    if [[ -f $1 ]] && [[ -f $2 ]]; then
        local TMPFILE=tmp.$$
        mv "$1" $TMPFILE
        mv "$2" "$1"
        mv $TMPFILE "$2"
    else
        echo -e "${RED}Error:$NC One or more files don't exist"
        return 1
    fi
}

cget() {
    curl -fJOL --compressed "$@"
}

function f() {
    q="*$1*"
    find . -iname $q
}

function md2pdf() {
    pandoc -s $1 -o $1.pdf --smart
}

function d720p() {
    for i in $@; do
        youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' ${i} 
    done
}

# zsh functions {{{
precmd() {
    print -Pn "\e]2;%3d\a"
}

_rationalise-dot() {
    if [[ $LBUFFER = "cd "* ]]; then
        if [[ $LBUFFER = *.. ]]; then
            LBUFFER+=/..
        else
            LBUFFER+=.
        fi
    else
        LBUFFER+=.
    fi
}
zle -N _rationalise-dot
bindkey . _rationalise-dot

# }}}
