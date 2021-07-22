#!/bin/bash

# From AnberPorts

# Main
main () {
    cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/ecwolf" || exit
    SDL_GAMECONTROLLERCONFIG="$( cat gamecontrollerdb.txt )"
    export SDL_GAMECONTROLLERCONFIG
    ./ecwolf --config ./ecwolf.cfg --data SD3
    unset SDL_GAMECONTROLLERCONFIG
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
