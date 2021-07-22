#!/bin/bash

# From AnberPorts

# Main
main () {
    GAMEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/digger"
    LIBDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/lib64"
    BINDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/AnberPorts/bin"

    # system
    export LD_LIBRARY_PATH="${LIBDIR}":/usr/lib

    cd "${GAMEDIR}" || exit

    if id "ark" &>/dev/null || id "odroid" &>/dev/null; then
        sudo "${BINDIR}"/oga_controls digger &
    else
        "${BINDIR}"/oga_controls digger &
    fi

    ./digger 2>&1 | tee -a ./log.txt
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
