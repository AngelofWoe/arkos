#!/bin/bash

# Start rg351p-js2xbox for input
start_oga () {
	sudo rg351p-js2xbox --silent -t oga_joypad &
	sleep 1
	sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
	sleep 1
}

# Ask for old password and new password then attempt to change it
change_pass () {
	OLD_PASS=$( osk "Enter OLD password." | tail -n 1 )
	NEW_PASS=$( osk "Enter NEW password." | tail -n 1 )

	echo "${OLD_PASS} : ${NEW_PASS}"

	if echo -e "${OLD_PASS}\n${NEW_PASS}\n${NEW_PASS}" | (passwd ark); then
		msgbox "Password successfully changed."
	else
		msgbox "Password change failed."
	fi
}

# Kill rg351p-js2xbox and rm input file
cleanup () {
	sudo kill "$(pidof rg351p-js2xbox)"
	sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Main
main () {
	printf "\033c" >> /dev/tty1
	clear
	start_oga
	change_pass
	cleanup
	clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
