#!/bin/bash

# Main
main () {
    CONFIG=/home/ark/.config/arkos.cfg
    . "${CONFIG}"
    if [ "${wifi}" = true ]; then
        sudo nmcli r wifi off
        sed -i 's/wifi=true/wifi=false/g' "${CONFIG}"
        if [[ "$( nmcli radio wifi )" != "disabled" ]]; then
            printf "\n\e[32mProblem disabling WiFi.\n"
        else
            printf "\n\e[32mWiFi has been disabled.\n"
        fi
    elif [ "${wifi}" = false ]; then
        sudo nmcli r wifi on
        sed -i 's/wifi=false/wifi=true/g' "${CONFIG}"
        if [[ "$( nmcli radio wifi )" != "enabled" ]]; then
            printf "\n\e[32mProblem enabling WiFi.\n"
        else
            printf "\n\e[32mWiFi has been enabled.\n"
        fi
    fi
    sleep 1
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
