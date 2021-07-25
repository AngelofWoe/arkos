#!/bin/bash

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    sudo umount /dev/mmcblk0p3
    sudo fsck.exfat -y /dev/mmcblk0p3
    sudo mount -t exfat /dev/mmcblk0p3 /roms
    sleep 2
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi