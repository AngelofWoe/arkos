#!/bin/bash

# Main
main () {
    /usr/local/bin/retroarch32 -L /home/ark/.config/retroarch32/cores/vitaquake2_libretro.so /roms/ports/quake2/baseq2/
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
