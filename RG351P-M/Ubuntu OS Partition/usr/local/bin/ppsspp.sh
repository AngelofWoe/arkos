#!/bin/bash

# Main
main () {
    if  [[ "${1}" == "standalone" ]] || [[ "${1}" == "standalone-go" ]]; then
        if [[ "${1}" == "standalone" ]]; then type="sdl"; fi
        if [[ "${1}" == "standalone-go" ]]; then type="go"; cp /home/ark/.asoundrcbak /home/ark/.asoundrc; fi
        sudo systemctl start ppsspphotkey.service
        cp -f /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini."${type}" /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini
        /opt/ppsspp/PPSSPPSDL --fullscreen "${2}"
        cp -f /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini."${type}"
        sudo systemctl stop ppsspphotkey.service
    else
        /usr/local/bin/retroarch -L /home/ark/.config/retroarch/cores/ppsspp_libretro.so "${2}"
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
