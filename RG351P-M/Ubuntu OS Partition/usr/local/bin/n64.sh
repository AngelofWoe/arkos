#!/bin/bash

# Main
main () {
    if  [[ "${1}" == "standalone-Rice" ]] || [[ "${1}" == "standalone-Glide64mk2" ]]; then
        : "${1#standalone-}" # Set temp variable to $1 without the standalone-
        emu="${_,,}" # Take temp variable and set to all lowercase
        /opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /opt/mupen64plus --gfx mupen64plus-video-"${emu}".so --corelib /opt/mupen64plus/libmupen64plus.so.2 --datadir /opt/mupen64plus "${2}"
    else
        /usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
