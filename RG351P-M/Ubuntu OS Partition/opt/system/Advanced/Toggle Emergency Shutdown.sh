#!/bin/bash

# Main
main () {
    if ! systemctl is-enabled --quiet emergency_shutdown.service || ! systemctl is-active --quiet emergency_shutdown.service; then
        printf "\n\n\e[32mEnabling Emergency Shutdown Service. Please wait...\n"
        sudo systemctl enable emergency_shutdown.service
        sudo systemctl start emergency_shutdown.service
        printf "\n\n\n\e[32mEmergency Shutdown Service has been enabled.\n"
        sleep 5
    else
        sudo systemctl disable emergency_shutdown.service
        sudo systemctl stop emergency_shutdown.service
        printf "\n\n\n\e[32mEmergency Shutdown Service has been disabled.\n"
        sleep 2
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
