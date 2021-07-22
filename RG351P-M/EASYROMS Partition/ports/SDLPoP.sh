#!/bin/bash

# Main
main () {
    SDL_GAMECONTROLLERCONFIG="$( cat /roms/ports/sdlpop/gamecontrollerdb.txt )"
    export SDL_GAMECONTROLLERCONFIG
    /roms/ports/sdlpop/prince
    unset SDL_GAMECONTROLLERCONFIG
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
