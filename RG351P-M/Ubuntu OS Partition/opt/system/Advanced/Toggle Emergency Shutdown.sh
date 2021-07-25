#!/bin/bash

# Main
main () {
    SERVICE="emergency_shutdown.service"

    if ! systemctl is-enabled --quiet "${SERVICE}" || ! systemctl is-active --quiet "${SERVICE}"; then
        printf "\n\n\e[32mEnabling Emergency Shutdown Service. Please wait...\n"
        sudo systemctl enable "${SERVICE}"
        sudo systemctl start "${SERVICE}"
        printf "\n\n\n\e[32mEmergency Shutdown Service has been enabled.\n"
        sleep 5
    else
        sudo systemctl disable "${SERVICE}"
        sudo systemctl stop "${SERVICE}"
        printf "\n\n\n\e[32mEmergency Shutdown Service has been disabled.\n"
        sleep 2
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
