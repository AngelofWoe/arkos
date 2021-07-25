#!/bin/bash

# Main
main () {
	printf "\033c" >> /dev/tty1
	clear
	if sudo umount /mnt/usbdrive ; then
		printf "\n\n\e[32mUSB drive has been safely unmounted from /mnt/usbdrive...\n"
		printf "\033[0m"
		sleep 3
	else
		printf "\n\n\e[91mThere was no USB drive available to unmount from /mnt/usbdrive...\n"
		printf "\033[0m"
		sleep 3
	fi
	clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
