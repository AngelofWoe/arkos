#!/bin/bash

# Main
main () {
    cd /opt/drastic || exit
    ./drastic "${1}"
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
