#!/bin/bash

# Main
main () {
    SDL_GAMECONTROLLERCONFIG="$( cat /roms/ports/sonic1/gamecontrollerdb.txt )"
    export SDL_GAMECONTROLLERCONFIG
    /roms/ports/sonic1/sonic2013
    unset SDL_GAMECONTROLLERCONFIG
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
