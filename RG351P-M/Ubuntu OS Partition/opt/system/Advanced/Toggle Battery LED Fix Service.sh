#!/bin/bash

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    SERVICE="batt_led_fix.service"
    
    if ! systemctl is-enabled --quiet "${SERVICE}"; then
        printf "\n\n\e[32mEnabling Battery LED Fix Service on Boot. Please wait...\n"
        sudo systemctl enable "${SERVICE}"
        printf "\n\n\n\e[32mBattery LED Fix Service on Boot has been enabled.\n"
        sleep 5
    else
        sudo systemctl disable "${SERVICE}"
        printf "\n\n\n\e[32mBattery LED Fix Service on Boot has been disabled.\n"
        sleep 2
    fi
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
