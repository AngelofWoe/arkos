#!/bin/bash

# Main
main () {
	if  [[ "${1}" == "standalone" ]]; then
		if [ ".$(echo "${2}"| cut -d. -f2)" == ".sh" ] || [ ".$(echo "${2}"| cut -d. -f2)" == ".SH" ]; then
			"${2}"
		else
			/opt/lzdoom/lzdoom -iwad "${2}"
		fi
	else
		/usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
	fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
