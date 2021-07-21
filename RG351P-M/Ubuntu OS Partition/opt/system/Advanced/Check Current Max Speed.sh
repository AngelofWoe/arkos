#!/bin/bash

# Start rg351p-js2xbox for output
start_oga () {
    sudo rg351p-js2xbox --silent -t oga_joypad &
    sleep 1
    sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
    sleep 1
    sudo chmod 777 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Clean up rg351p-js2xbox
cleanup () {
    sudo kill "$(pidof rg351p-js2xbox)"
    sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Main
main () {
    start_oga
    sudo msgbox "$(lscpu | grep "CPU max MHz")"
    cleanup
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi