#!/usr/bin/env bash

# TODO: sudo updatedb regularly
if [ -n "$@" ] && [ "$@" != "\n" ]; then
    res=$(echo "$@" | sed 's/~/\/home\/rprtr258/' | sed 's/#/\/mnt\/hdd/')
    coproc open "$res" >/dev/null
    exit 0
else
    cat /home/rprtr258/.config/rofi/locate/db
fi

