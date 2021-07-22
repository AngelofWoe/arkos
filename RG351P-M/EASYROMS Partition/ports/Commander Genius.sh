#!/bin/bash

# Main
main () {
    /home/ark/.config/CGenius/CGeniusExe
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
