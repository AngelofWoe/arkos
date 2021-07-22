#!/bin/bash

# Main
main () {
    SDL_GAMECONTROLLERCONFIG="$( cat /roms/ports/devilution/gamecontrollerdb.txt )"
    export SDL_GAMECONTROLLERCONFIG
    /home/ark/.config/devilution/devilutionx
    unset SDL_GAMECONTROLLERCONFIG
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
