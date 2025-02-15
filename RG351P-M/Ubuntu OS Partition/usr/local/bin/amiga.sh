#!/bin/bash

# Main
main () {
    if  [[ $1 == "standalone" ]]; then
        /usr/local/bin/amiberry.sh "${2}"
    else
        /usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
