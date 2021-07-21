#!/bin/bash

# Main
main () {
    sudo nmcli r wifi on
    printf "\n\n\n\e[32mWifi has been enabled.\n"
    sleep 1
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi