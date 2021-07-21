#!/bin/bash

main () {
    sudo nmcli r wifi off
    printf "\n\n\n\e[32mWifi has been disabled.\n"
    sleep 1
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi