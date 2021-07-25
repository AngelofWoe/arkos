#!/bin/bash

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    if [[ "$( nmcli radio wifi )" == "enabled" ]]; then
        sudo nmcli r wifi off
        if [[ "$( nmcli radio wifi )" != "disabled" ]]; then
            printf "\n\e[32mProblem disabling WiFi.\n"
        else
            printf "\n\e[32mWiFi has been disabled.\n"
        fi
    elif [[ "$( nmcli radio wifi )" == "disabled" ]]; then
        sudo nmcli r wifi on
        if [[ "$( nmcli radio wifi )" != "enabled" ]]; then
            printf "\n\e[32mProblem enabling WiFi.\n"
        else
            printf "\n\e[32mWiFi has been enabled.\n"
        fi
    fi
    sleep 1
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
