#!/bin/bash

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    if [ ! -d "/mnt/usbdrive/" ]; then
        sudo mkdir /mnt/usbdrive
    fi

    filesystem=$( lsblk -no FSTYPE /dev/sda1 )
    if [ "${filesystem}" = "ntfs" ]; then
        filesystem="ntfs-3g"
    fi

    if sudo mount -t "${filesystem}" /dev/sda1 /mnt/usbdrive -o uid=1002 ; then
        printf "\n\n\e[32m%s USB drive is mounted to /mnt/usbdrive...\n" "${filesystem}"
        printf "\033[0m"
        sleep 3
    else
        printf "\n\n\e[91mCould not find a Fat, Fat32, Exfat, or NTFS based USB drive to mount...\n"
        printf "\033[0m"
        sleep 3
    fi
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
