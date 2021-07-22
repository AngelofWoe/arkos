#!/bin/bash

# Main
main () {
    /usr/local/bin/retroarch -L /home/ark/.config/retroarch/cores/nxengine_libretro.so /roms/ports/cavestory/Doukutsu.exe
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
