#!/bin/bash

# From AnberPorts

# Main
main () {
    GAMEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/diablo1"
    LIBDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/lib64"
    BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/bin"

    # gl4es
    export LIBGL_FB=4

    # system
    export LD_LIBRARY_PATH="${LIBDIR}":/usr/lib

    cd "${GAMEDIR}" || exit

    if id "ark" &>/dev/null || id "odroid" &>/dev/null; then
        sudo "${BINDIR}"/oga_controls devilutionx &
    else
        "${BINDIR}"/oga_controls devilutionx &
    fi

    ./devilutionx 2>&1 | tee -a ./log.txt

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
