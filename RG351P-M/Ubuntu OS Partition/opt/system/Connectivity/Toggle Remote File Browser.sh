#!/bin/bash

# Main
main () {
    clear
    SERVICE="remote_file_browser.service"

    if ! systemctl is-active --quiet "${SERVICE}"; then
        GW=$( ip route | awk '/default/ { print $3 }' )
        if [ -n "${GW}" ]; then
            printf "\n\e[32mEnabling Remote File Browser.  Please wait...\n"						
            if ! sudo systemctl start "${SERVICE}" ; then
                printf "\n\n\e[91mUnable to start Remote File Browser.\n"
            else
                printf "\n\n\e[32mRemote File Browser has been enabled.\n"
                printf "Your IP is: %s\n\n" "$( ip route | awk '/src/ { print $9 }' )"
            fi
        else
            printf "\n\n\e[91mYour network connection doesn't seem to be working. Did you make sure to configure your WiFi connection using the WiFi Connection Manager in the Options/Connectivity menu?\n"
        fi
    else
        printf "\n\e[32mDisabling Remote File Browser.  Please wait...\n"
        if ! sudo systemctl stop "${SERVICE}" ; then
            printf "\n\e[91mUnable to stop remote file browser\n"
        else
            printf "\n\n\e[32mRemote File Browser has been disabled.\n"
        fi
    fi

    sleep 5
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
