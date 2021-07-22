#!/bin/bash

# From AnberPorts

# Main
main () {
    GAMEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/Half-Life"
    LIBDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/lib64"

    # system
    export LD_LIBRARY_PATH="${GAMEDIR}"/lib:"${LIBDIR}":/usr/lib

    cd "${GAMEDIR}" || exit

    ./xash3d -fullscreen -console -sdl_joy_old_api -game bshift 2>&1 | tee -a ./log.txt
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
