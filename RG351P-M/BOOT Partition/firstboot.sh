#!/bin/bash

# Final cleanup
final_cleanup () {
    systemctl disable firstboot.service
    rm -v /boot/firstboot.sh
}

# Unmount /roms and link disks
unmount_link () {
	umount /roms
    ln -s /dev/mmcblk0 /dev/hda
    ln -s /dev/mmcblk0p3 /dev/hda3
}

# Start rg351p-js2xbox with input
oga_start () {
	sudo rg351p-js2xbox --silent -t oga_joypad &
	sleep 1
	sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
	sleep 1
}

# Cleanup oga_start
oga_cleanup () {
    kill "$(pidof rg351p-js2xbox)"
    rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Start unmount_link and notification message
initial_start () {
	if ! unmount_link ; then
		echo "Error unmounting /roms and linking disks."
		exit 1
	elif ! msgbox "EASYROMS partition expansion and conversion to exfat in process.  Please be patient as the system will reboot 2 to 3 times to complete this.  Hit A to continue." ; then
		echo "Error sending notification"
		exit 1
	elif ! echo ", +" | sfdisk -N 3 --force /dev/mmcblk0 ; then
		echo "Error performing sfdisk"
		exit 1
	else
		touch "/boot/doneit"
		reboot
	fi
}

# First time
initial () {
	if ! oga_start ; then
		echo "Error starting rg351p-js2xbox and oga_controls." > /dev/tty1 2>&1
		exit 1
	elif ! initial_start > /dev/tty1 2>&1 ; then
		echo "Error running unmount_link and notification message" > /dev/tty1 2>&1
		exit 1
	fi
}

# Second time to actually extend the drive
extend_exfat () {
	echo "Starting second boot sequence"
	
	if ! unmount_link ; then
		echo "Error unmounting /roms and linking disks"
		exit 1
	else
		ntfsfix -d /dev/hda3
		ntfsresize -ff -x /dev/hda3
		ntfsfix -d /dev/hda3
		mkfs.exfat -s 8K -n EASYROMS /dev/hda3
		sync
		sleep 2
		fsck.exfat -a /dev/hda3
		sync
		sleep 2
		mount -t exfat -w /dev/mmcblk0p3 /roms
		sleep 2
		tar -xvf /roms.tar -C /
		sync
		reqSpace=1000000
		availSpace="$( df '/roms' | awk 'NR==2 { print $4 }' )"
		if (( availSpace < reqSpace )); then
			rm -rf -v /tempthemes/es-theme-epic-cody-RG351P-M/
		fi
		mv -v /tempthemes/* /roms/themes
		sync
		sleep 1
		rm -rf -v /tempthemes
		sleep 2
		umount /roms
		cp /boot/fstab.exfat /etc/fstab
		sync
		rm -f /boot/doneit
		rm -f /roms.tar
		rm -f /boot/fstab.exfat
	fi
}

# Main
main () {
	# Very first boot
	if [ ! -f /boot/doneit ]; then
		if ! initial ; then
			echo "Intial setup to change the EASYROMS partition to exFAT and extend it have failed." > /dev/tty1 2>&1
		fi
    elif ! extend_exfat > /dev/tty1 2>&1 ; then
		if ! oga_start ; then
			echo "Error starting rg351p-js2xbox and oga for I/O" >> /dev/tty1 2>&1
			exit 1
		elif msgbox "EASYROMS partition expansion and conversion to exfat failed for an unknown reason.  Please expand the partition using an alternative tool such as Minitool Partition Wizard.  System will reboot and load Emulationstation now after you hit the A button." ; then
			echo "Unable to send notification." >> /dev/tty1 2>&1
			if ! oga_cleanup  >> /dev/tty1 2>&1 ; then
				echo "Unable to clear rg351p-js2xbox and oga" >> /dev/tty1 2>&1
			fi
			exit 1
		fi
	elif ! oga_start ; then
		echo "Error starting rg351p-js2xbox and oga for I/O" >> /dev/tty1 2>&1
		exit 1
	elif ! msgbox "Completed expansion of EASYROMS partition and conversion to exfat. System will reboot and load Emulationstation now after you hit the A button." ; then
		echo "Error sending notification" >> /dev/tty1 2>&1
		if ! oga_cleanup >> /dev/tty1 2>&1 ; then
			echo "Unable to clear rg351p-js2xbox and oga" >> /dev/tty1 2>&1
		fi
		exit 1
	elif ! final_cleanup >> /dev/tty1 2>&1 ; then
		echo "Unable to do final cleanup" >> /dev/tty1 2>&1
		exit 1
	fi
	
	reboot
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
