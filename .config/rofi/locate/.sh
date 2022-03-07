#!/usr/bin/env bash

# TODO: sudo updatedb regularly
if [ -n "$@" ] && [ "$@" != "\n" ]; then
    coproc open "$@" >/dev/null
    exit 0
else
    locate /home/ /mnt/hdd/GTD/
fi

