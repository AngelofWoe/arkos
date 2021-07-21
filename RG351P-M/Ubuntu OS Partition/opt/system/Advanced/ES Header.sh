#!/bin/bash

# Main
main () {
    sudo cp -f /usr/bin/emulationstation/emulationstation.header /usr/bin/emulationstation/emulationstation
    printf "\033c" | sudo tee -a /dev/tty1 > /dev/null
    sudo systemctl restart emulationstation
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi