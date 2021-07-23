#!/bin/bash

# Main
main () {
    if ! systemctl is-enabled --quiet ssh.service; then
        printf "\n\n\e[32mEnabling SSH on Boot. Please wait...\n"
        sudo systemctl enable ssh.service
        printf "\n\n\n\e[32mSSH on Boot has been enabled. You will need to reboot or enable SSH separately.\n"
        sleep 5
    else
        sudo systemctl disable ssh.service
        printf "\n\n\n\e[32mSSH on Boot has been disabled. You will need to reboot or disable SSH separately.\n"
        sleep 2
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
