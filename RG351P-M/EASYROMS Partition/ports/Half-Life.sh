#!/bin/bash

# Main
main () {
    cd /roms/ports/Half-Life || exit
    LD_LIBRARY_PATH=. ./xash3d -fullscreen -console -sdl_joy_old_api
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
