#!/usr/bin/env bash

if [ -n "$@" ] && [ "$@" != "\n" ]; then
    # TODO: change to pipe from echo
    echo "$@" > /tmp/rofi_pastes
    xsel --clipboard -i < /tmp/rofi_pastes
    exit 0
else
    cat /home/rprtr258/.config/rofi/pastes/data
fi

