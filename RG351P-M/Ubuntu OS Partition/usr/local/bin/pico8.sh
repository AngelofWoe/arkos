#!/bin/bash

# Main
main () {
	basefile=$(basename -- "${2}")
	basefilenoext=${basefile%.*}

	if [[ "${1}" == "float-scaled" ]]; then
		option=''
	elif [[ "${1}" == "pixel-perfect" ]]; then
		option=' -pixel_perfect 1'
	else
		option=' -draw_rect 0,0,480,320'
	fi

	if [[ "${basefilenoext,,}" == "zzzsplore" ]]; then
		/roms/pico-8/pico8_dyn -splore -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0"${option}"
	else
		/roms/pico-8/pico8_dyn -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0 -run"${option}" "${2}"
	fi

	mv -f /roms/pico-8/bbs/carts/*.png /roms/pico-8/carts/
	mv -f /roms/pico-8/bbs/carts/*.PNG /roms/pico-8/carts/
	mv -f /roms/pico-8/bbs/carts/*.p8 /roms/pico-8/carts/
	mv -f /roms/pico-8/bbs/carts/*.P8 /roms/pico-8/carts/
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
