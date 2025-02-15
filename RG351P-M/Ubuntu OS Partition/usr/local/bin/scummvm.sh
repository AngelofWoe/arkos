#!/bin/bash

# Main
main () {
    if [[ "${2}" == "/roms/scummvm/Scan_for_new_games.scummvm" ]]; then
        printf "\033c" >> /dev/tty1
        cd /roms/scummvm || exit
        ./Scan_for_new_games.scummvm
        {
            printf "\n\nFinished scanning the scummvm folder for games.
            \nPlease restart emulationstaton to find the new shortcuts
            \ncreated if any."
        } >> /dev/tty1
        sleep 5
        printf "\033c" >> /dev/tty1
    elif [[ "${1}" == "standalone" ]] && [[ "${2,,}" != "/roms/scummvm/menu.scummvm" ]]; then
        cd /opt/scummvm || exit
        DIR="$( cd "$( dirname "${2}" )" >/dev/null 2>&1 && pwd )/"
        ./scummvm --auto-detect --path="${DIR}"
    elif [[ "${1}" == "standalone" ]] && [[ "${2,,}" == "/roms/scummvm/menu.scummvm" ]]; then
        cd /opt/scummvm || exit
        ./scummvm
    elif  [[ "${3,,}" == "/roms/scummvm/menu.scummvm" ]]; then
        /usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so
    else
        /usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
