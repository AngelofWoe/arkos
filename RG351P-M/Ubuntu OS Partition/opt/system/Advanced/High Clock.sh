#!/bin/bash

# Main
main () {
    sudo sed -i '/load mmc 1:1 ${dtb_loadaddr} rk3326-rg351p-linux.dtb/c\    load mmc 1:1 ${dtb_loadaddr} rk3326-rg351p-linux.dtb.15' /boot/boot.ini
    sudo reboot
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi