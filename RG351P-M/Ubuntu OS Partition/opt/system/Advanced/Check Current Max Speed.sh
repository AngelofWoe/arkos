#!/bin/bash

# Start rg351p-js2xbox for output
start_oga () {
    sudo rg351p-js2xbox --silent -t oga_joypad &
    sleep 1
    sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
    sleep 1
}

# Clean up rg351p-js2xbox
cleanup () {
    sudo kill "$( pidof rg351p-js2xbox )"
    sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    start_oga
    sudo msgbox "$( lscpu | grep "CPU max MHz" )"
    cleanup
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi