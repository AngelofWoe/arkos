#!/bin/bash

# Main
main () {
    sudo systemctl start solarushotkey
    cd /opt/solarus/ || exit
    /opt/solarus/solarus-run "${1}"
    sudo systemctl stop solarushotkey
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
