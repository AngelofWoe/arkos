#!/bin/bash

# Main
main () {
    GAMEDIR=/roms/ports/sorr

    cd "${GAMEDIR}" || exit 1
    
    if [[ -f "$( find ${GAMEDIR} -type f -iname "sorr.dat" )" ]]; then
        DATFILE="$( find ${GAMEDIR} -type f -iname "sorr.dat" )"
    else
        exit 1
    fi

    sudo "${GAMEDIR}"/oga_controls &
    "${GAMEDIR}/bgdi" "${DATFILE}"
    sudo kill -9 "$( pidof oga_controls )"
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
