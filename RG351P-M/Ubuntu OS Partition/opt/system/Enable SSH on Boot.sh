#!/bin/bash

# Main
main () {
    printf "\n\n\e[32mEnabling SSH on Boot.  Please wait...\n"							
    sudo systemctl enable ssh
    printf "\n\n\n\e[32mSSH on Boot has been enabled. You will need to reboot or enable SSH separately.\n"
    sleep 5
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi