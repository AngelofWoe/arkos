#!/bin/bash

# oga_start
oga_start () {
    sudo rg351p-js2xbox --silent -t oga_joypad &
    sleep 1
    sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
    sudo chmod 777 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Cleanup
cleanup () {
    sudo kill "$( pidof rg351p-js2xbox )"
    sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Main
main () {
    if  [[ "${1}" == "retroarch" ]] || [[ "${1}" == "retroarch32" ]]; then
        /usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
    elif [[ "${1}" == "retrorun" ]] || [[ "${1}" == "retrorun32" ]]; then
        oga_start
        /usr/bin/"${1}" --triggers -n -s /roms/dreamcast -d /roms/bios /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
        cleanup
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
