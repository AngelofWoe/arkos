#!/bin/bash

# Main
main () {
    /usr/local/bin/retroarch -L /home/ark/.config/retroarch/cores/2048_libretro.so
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
