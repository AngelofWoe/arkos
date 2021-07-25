#!/bin/bash

# Main
main () {
	clear
	BACKUP_DIR="/roms/backup"
	BACKUP_FILE="${BACKUP_DIR}/arkosbackup.tar.gz"
	LOG_FILE="${BACKUP_DIR}/lastarkosrestore.log"

	printf "\033[0mRestoring a backup.  Please wait...\n"
	sleep 2

	sudo chmod 666 /dev/tty1
	tail -f "${LOG_FILE}" >> /dev/tty1 &

	if sudo tar --same-owner -zxhvf "${BACKUP_FILE}" -C / | tee -a "${LOG_FILE}"; then
		printf "\n\n\e[32mThe restore completed successfuly. \nYou will need to reboot your system in order for your restored settings to take effect! \n" | tee -a "${LOG_FILE}"
		printf "\033[0m" | tee -a "${LOG_FILE}"
		sleep 10
	else
		printf "\n\n\e[31mThe restore did NOT complete successfully! \n\e[33mVerify a valid arkosbackup.tar.gz exist in \nyour easyroms/backup folder then try again.\n" | tee -a "${LOG_FILE}"
		printf "\033[0m" | tee -a "${LOG_FILE}"
		sleep 10
	fi
	clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi