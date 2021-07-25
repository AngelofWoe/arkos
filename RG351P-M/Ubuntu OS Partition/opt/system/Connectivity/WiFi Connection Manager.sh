#!/bin/bash

# oga_start
oga_start () {
    sudo rg351p-js2xbox --silent -t oga_joypad &
    sleep 1
    sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
    sleep 1
}

# Cleanup
cleanup () {
    sudo kill "$(pidof rg351p-js2xbox)"
    sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    oga_start
    sudo nmui
    cleanup
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
