#!/bin/bash

# Main
main () {
    /usr/local/bin/retroarch -L /home/ark/.config/retroarch/cores/cannonball_libretro.so /roms/ports/cannonball/epr-10187.88
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
