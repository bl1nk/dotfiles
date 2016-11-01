#!/bin/bash

target="$1"

herbstclient complete 1 attr monitors. | while read line; do
	if [[ $line == *.by-name.  || $line == *.focus. ]]; then
    	continue
    fi
    if [[ $(herbstclient attr "${line}tag") == $target ]]; then
    	line=${line##monitors.}
        line=${line%.}
    	herbstclient focus_monitor "${line}"
        exit
    fi
done

herbstclient use "$target"