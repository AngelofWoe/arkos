#!/bin/bash

# Main
main () {
    CONFIG=/home/ark/.config/arkos.cfg
    . "${CONFIG}"
    
    if [ "${remotefilebrowser}" = false ]; then
        GW=$( ip route | awk '/default/ { print $3 }' )
        if [ -n "${GW}" ]; then
            printf "\n\n\e[32mEnabling Remote File Browser.  Please wait...\n"						
            sudo timedatectl set-ntp 1 &
            sudo systemctl start smbd
            sudo systemctl start nmbd
            sudo filebrowser -a 0.0.0.0 -p 80 -d /home/ark/.config/filebrowser.db &
            sed -i 's/remotefilebrowser=false/remotefilebrowser=true/g' "${CONFIG}"
            printf "\n\n\n\e[32mRemote File Browser has been enabled.\n"
            printf "Your IP is: %s\n\n" "$( ip route | awk '/src/ { print $9 }' )"
            sleep 5
        else
            printf "\n\n\n\e[91mYour network connection doesn't seem to be working. Did you make sure to configure your WiFi connection using the WiFi Connection Manager in the Options/Connectivity menu?\n"
            sleep 5
        fi
    elif [ "${remotefilebrowser}" = true ]; then
        sudo timedatectl set-ntp 0
        sudo systemctl stop smbd
        sudo systemctl stop nmbd
        sudo pkill filebrowser
        printf "\n\n\n\e[32mRemote File Browser has been disabled.\n"
        sed -i 's/remotefilebrowser=true/remotefilebrowser=false/g' "${CONFIG}"
        sleep 2
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
