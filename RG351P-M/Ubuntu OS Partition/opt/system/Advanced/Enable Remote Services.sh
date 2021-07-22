#!/bin/bash

# Main
main () {
    GW=$( ip route | awk '/default/ { print $3 }' )
    if [ -n "$GW" ]; then
        printf "\n\n\e[32mEnabling Remote Services.  Please wait...\n"
        sudo timedatectl set-ntp 1 &
        sudo systemctl start smbd
        sudo systemctl start nmbd
        sudo systemctl start ssh.service
        sudo filebrowser -a 0.0.0.0 -p 80 -d /home/ark/.config/filebrowser.db &
        printf "\n\n\n\e[32mRemote Services have been enabled.\n"
        printf "Your IP is: %s\n\n" "$( ip route | awk '/src/ { print $9 }' )"
        sleep 5
    else
        printf "\n\n\n\e[91mYour network connection doesn't seem to be working.  Did you make sure to configure your wifi connection using the Wifi selection in the Options menu?\n"
        sleep 5
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
