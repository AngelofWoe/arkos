#!/bin/bash

# From AnberPorts

# Main
main () {
    GAMEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/quake3"
    LIBDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/lib32"
    BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/bin"

    # system
    export LD_LIBRARY_PATH="${LIBDIR}":/usr/lib32:/usr/local/lib/arm-linux-gnueabihf/

    cd "${GAMEDIR}" || exit

    if id "ark" &>/dev/null || id "odroid" &>/dev/null; then
        sudo "${BINDIR}"/oga_controls quake3.armv7l &
    else
        patchelf --set-interpreter /usr/lib32/ld-linux-armhf.so.3 ./quake3.armv7l
        "${BINDIR}"/oga_controls quake3.armv7l &
    fi

    ./quake3.armv7l 2>&1 | tee -a ./log.txt

    # make sure AnberPorts-Joystick is killed if quit via game menu
    if id "ark" &>/dev/null || id "odroid" &>/dev/null; then
        pgrep -f oga_controls | sudo xargs kill -9
    else
        pgrep -f oga_controls | xargs kill -9
    fi
}


# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
