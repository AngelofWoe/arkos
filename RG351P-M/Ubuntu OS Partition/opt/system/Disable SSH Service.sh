#!/bin/bash

# Main
main () {
    sudo systemctl stop ssh.service
    printf "\n\n\n\e[32mSSH Service has been disabled.\n"
    sleep 2
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi