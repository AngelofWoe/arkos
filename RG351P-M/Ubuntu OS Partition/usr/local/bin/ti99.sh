#!/bin/bash

# Main
main () {
    sudo systemctl start ti99hotkey
    cd /opt/ti99sim/bin || exit
    sleep 2
    ./ti99sim-sdl -f --console=/roms/bios/ti-994a.ctg "${1}"
    sudo systemctl stop ti99hotkey
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
