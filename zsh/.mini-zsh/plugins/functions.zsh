swap() {
    if [[ -z $1 ]] || [[ -z $2 ]] || [[ $1 = "-h" ]]
    then
        echo -e "Usage: swap <file> <file>";
        echo -e "Swaps files";
        return 1
    fi
    if [[ -f $1 ]] && [[ -f $2 ]]
    then
        local TMPFILE=tmp.$$
        mv "$1" $TMPFILE
        mv "$2" "$1"
        mv $TMPFILE "$2"
    else
        echo -e "Error: One or more files don't exist"
        return 1
    fi
}

latest_cdn () {
    ssh markus@schoko.kuchen.io 'for f in $(\ls -1t /srv/http/io.kuchen.cdn) ; do echo "https://cdn.kuchen.io/${f}" ; done' | head -n5
}
