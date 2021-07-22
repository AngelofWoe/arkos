#!/bin/bash

# Main
main () {
    /usr/local/bin/retroarch -L /home/ark/.config/retroarch/cores/prboom_libretro.so /roms/ports/doom/Doom.wad
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
