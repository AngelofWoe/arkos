#!/bin/bash

main () {
	printf "\033c" >> /dev/tty1
	clear
	BACKUP_DIR="/roms/backup"
	LOG_FILE="${BACKUP_DIR}/arkosbackup.log"
	BACKUP_FILE="${BACKUP_DIR}/arkosbackup.tar.gz"
	printf "\033[0mCreating a backup.  Please wait...\n"
	sleep 2

	if [ ! -d "${BACKUP_DIR}" ]; then
		sudo mkdir -v "${BACKUP_DIR}"
	fi
	if [ -f "${BACKUP_FILE}" ]; then
		sudo rm "${BACKUP_FILE}"
	fi
	if [ -f "${LOG_FILE}" ]; then
		sudo rm "${LOG_FILE}"
	fi

	touch "${LOG_FILE}"
	sudo chmod 666 /dev/tty1
	tail -f "${LOG_FILE}" >> /dev/tty1 &

	if sudo tar -zchvf "${BACKUP_FILE}" /etc/localtime /etc/NetworkManager/system-connections /home/ark/.config/retroarch/retroarch.cfg /home/ark/.config/retroarch/config /home/ark/.config/retroarch32/retroarch.cfg /home/ark/.config/retroarch32/config /home/ark/.emulationstation/collections /home/ark/.emulationstation/es_settings.cfg /opt/amiberry/savestates /opt/amiberry/whdboot /opt/mupen64plus/InputAutoCfg.ini /opt/drastic/config/drastic.cfg | sudo tee -a "${LOG_FILE}"; then
		printf "\n\n\e[32mThe backup completed successfuly. \nYour settings backup is located in the backup folder on the easyroms partition and is named arkosbackup.tar.gz. \nKeep it somewhere safe! \n"  | tee -a "${LOG_FILE}"
		printf "\033[0m"  | tee -a "${LOG_FILE}"
		sleep 10
	else
		printf "\n\n\e[31mThe backup did NOT complete successfully! \n\e[33mVerify you have at least 1GB of space available on your easyroms partition then try again.\n" | tee -a "${LOG_FILE}"
		printf "\033[0m" | tee -a "${LOG_FILE}"
		sleep 10
	fi
	clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi