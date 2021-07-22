#!/bin/bash

# Kill a process
killemu () {
    process="${1}"

    # Check for process
    processid=$( pgrep "${process}" )
    if [[ -n "${processid}" ]]; then
        pkill "${process}"
		while pgrep "${process}" >/dev/null; do
			sleep 1
		done
    fi
}

# Kill EmulationStation
killes () {
    espid=$( pgrep -f "/bin/sh /usr/bin/emulationstation/emulationstation.sh" )
    if [[ -n "${espid}" ]]; then
        touch /tmp/es-shutdown && chown ark:ark /tmp/es-shutdown
        pkill -P "${espid}"
		while pgrep -f "/bin/sh /usr/bin/emulationstation/emulationstation.sh" >/dev/null; do 
			sleep 1
		done
    fi
}

# Shutdown emulators
em_shutdown () {
    emulators=( "retroarch" "retrorun" "mupen" "lzdoom" "pico8" )

    for e in "${emulators[@]}"; do
        killemu "${e}"
    done
	sleep 5
	killes
	sleep 5
    shutdown -h now
}

# Main
main () {
	battlife="/sys/class/power_supply/battery/capacity"
	
	while true; do
		currbattlevel=$( cat "${battlife}" )
		
		if [ "${currbattlevel}" -le 15 ]; then
			em_shutdown
		elif [ "${currbattlevel}" -le 20 ]; then
			sleep 1
		elif [ "${currbattlevel}" -le 25 ]; then
			sleep 5
		elif [ "${currbattlevel}" -le 35 ]; then
			sleep 10
		elif [ "${currbattlevel}" -le 50 ]; then
			sleep 20
		elif [ "${currbattlevel}" -gt 50 ]; then
			sleep 30
		fi
	done		
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi