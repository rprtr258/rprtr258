#!/usr/bin/env bash

# TODO: sudo updatedb regularly
if [ -n "$@" ] && [ "$@" != "\n" ]; then
    coproc open "$@" >/dev/null
    exit 0
else
    locate /home/ /mnt/hdd/ | rg -v '/(\.git|\.cargo|\.local|\.cpan|\.cache|\.task|venv)/'
fi

