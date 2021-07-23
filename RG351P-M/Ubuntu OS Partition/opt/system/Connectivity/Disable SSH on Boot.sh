#!/bin/bash

# Main
main () {
    sudo systemctl disable ssh
    printf "\n\n\n\e[32mSSH on Boot has been disabled. You will need to reboot or disable SSH separately.\n"
    sleep 2
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi