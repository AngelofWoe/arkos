#!/bin/bash

# Start rg351-p-js2xbox for i/o
start_oga () {
	sudo rg351p-js2xbox --silent -t oga_joypad &
	sleep 1
	sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
	sleep 1
}

# Cleanup
cleanup () {
	sudo kill "$( pidof rg351p-js2xbox )"
	sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
}

# Main
main () {
	printf "\033c" >> /dev/tty1
	clear
	start_oga

	array=("$(nmcli -g uuid c s --active)")

	for i in "${array[@]}"; do
		connection_id=$( nmcli -g connection.id c s "${i}" )
		connection_info=$( nmcli -m tabular -f ip4.address,ip4.gateway,ip4.domain c s "${i}" )
		msgbox "$( printf "CONNECTION\n%s\n\n     %s" "${connection_id}" "${connection_info}" )"
	done

	cleanup
	clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
