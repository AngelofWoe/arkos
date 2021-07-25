#!/bin/bash

# Main
main () {
    SERVICE="ssh.service"
    
    if ! systemctl is-enabled --quiet "${SERVICE}"; then
        printf "\n\n\e[32mEnabling SSH on Boot. Please wait...\n"
        sudo systemctl enable "${SERVICE}"
        printf "\n\n\n\e[32mSSH on Boot has been enabled. You will need to reboot or enable SSH separately.\n"
        sleep 5
    else
        sudo systemctl disable "${SERVICE}"
        printf "\n\n\n\e[32mSSH on Boot has been disabled. You will need to reboot or disable SSH separately.\n"
        sleep 2
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
