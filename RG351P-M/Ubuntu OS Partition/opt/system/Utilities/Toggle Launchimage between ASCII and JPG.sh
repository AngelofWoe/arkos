#!/bin/bash

# Main
main () {
    # Source config file
    if . /home/ark/.config/arkos.cfg; then
        if [[ "${launchimage}" == "jpg" ]]; then # Switch from JPG to ASCII
            printf "\n\e[32mChanging to launchimage.ascii\n"
            sleep 2
            sed -i 's/\(launchimage=\)"jpg"/\1"ascii"/g' /home/ark/.config/arkos.cfg
            printf "\033c" | tee -a /dev/tty1
            sudo systemctl restart emulationstation
        elif [[ "${launchimage}" == "ascii" ]]; then # Switch from ASCII to JPG
            printf "\n\e[32mChanging to launchimage.jpg\n"
            sleep 2
            sed -i 's/\(launchimage=\)"ascii"/\1"jpg"/g' /home/ark/.config/arkos.cfg
            printf "\033c" | tee -a /dev/tty1
            sudo systemctl restart emulationstation
        fi
    else
        printf "n\e[32mUnable to locate configuration file\n"
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
