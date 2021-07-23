#!/bin/bash

# Main
main () {
    . /home/ark/.config/arkos.cfg
    if [[ "${esscreenmode}" == "fullscreen" ]]; then
        sudo cp -f /usr/bin/emulationstation/emulationstation.header /usr/bin/emulationstation/emulationstation
        sed -i 's/esscreenmode="fullscreen"/esscreenmode="header"/g' /home/ark/.config/arkos.cfg
    elif [[ "${esscreenmode}" == "header" ]]; then
        sudo cp -f /usr/bin/emulationstation/emulationstation.fullscreen /usr/bin/emulationstation/emulationstation
        sed -i 's/esscreenmode="header"/esscreenmode="fullscreen"/g' /home/ark/.config/arkos.cfg
    fi
    printf "\033c" | sudo tee -a /dev/tty1 > /dev/null
    sudo systemctl restart emulationstation
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi