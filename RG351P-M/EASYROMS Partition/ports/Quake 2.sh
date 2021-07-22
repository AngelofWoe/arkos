#!/bin/bash

# From AnberPorts

# Main
main () {
    cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/quake2" || exit

    # Directory is required or it won't run
    if ! [[ -d /home/ark/.yq2 ]]; then
        mkdir /home/ark/.yq2
    fi

    SDL_GAMECONTROLLERCONFIG="$( cat gamecontrollerdb.txt )"
    export SDL_GAMECONTROLLERCONFIG
    ./quake2
    unset SDL_GAMECONTROLLERCONFIG
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
