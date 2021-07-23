#!/bin/bash

# Main
main () {
    sudo systemctl start soniccdhotkey.service
    SDL_GAMECONTROLLERCONFIG="$( cat /roms/ports/soniccd/gamecontrollerdb.txt )"
    export SDL_GAMECONTROLLERCONFIG
    /usr/local/bin/soniccd
    unset SDL_GAMECONTROLLERCONFIG
    sudo systemctl stop soniccdhotkey.service
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
