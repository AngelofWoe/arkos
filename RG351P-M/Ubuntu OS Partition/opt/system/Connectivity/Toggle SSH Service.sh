#!/bin/bash

# Main
main () {
    if ! systemctl is-active --quiet ssh.service; then
        GW="$( ip route | awk '/default/ { print $3 }' )"
        if [ -n "$GW" ]; then
            printf "\n\n\e[32mEnabling SSH Service.  Please wait...\n"
            sudo systemctl start ssh.service
            printf "\n\n\n\e[32mSSH Service has been enabled.\n"
            printf "Your IP is: %s\n\n" "$( ip route | awk '/src/ { print $9 }' )"
            sleep 5
        else
            printf "\n\n\n\e[91mYour network connection doesn't seem to be working.  Did you make sure to configure your WiFi connection using the Wifi Connection Manager in the Options/Connectivity menu?\n"
            sleep 5
        fi
    else
        sudo systemctl stop ssh.service
        printf "\n\n\n\e[32mSSH Service has been disabled.\n"
        sleep 2
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
