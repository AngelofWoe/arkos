#!/bin/bash

basefile=$(basename -- $2)
basefilenoext=${basefile%.*}

if [[ $1 == "float-scaled" ]]; then
	if [[ ${basefilenoext,,} == "zzzsplore" ]]; then
		/roms/pico-8/pico8_dyn -splore -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0
	else
		/roms/pico-8/pico8_dyn -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0 -run "$2"
	fi
elif [[ $1 == "pixel-perfect" ]]; then
	if [[ ${basefilenoext,,} == "zzzsplore" ]]; then
		/roms/pico-8/pico8_dyn -splore -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0 -pixel_perfect 1
	else
		/roms/pico-8/pico8_dyn -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0 -pixel_perfect 1 -run "$2"
	fi
else
	if [[ ${basefilenoext,,} == "zzzsplore" ]]; then
		/roms/pico-8/pico8_dyn -splore -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0 -draw_rect 0,0,480,320
	else
		/roms/pico-8/pico8_dyn -home /roms/pico-8/ -root_path /roms/pico-8/carts/ -joystick 0 -draw_rect 0,0,480,320 -run "$2"
	fi
fi

mv -f /roms/pico-8/bbs/carts/*.png /roms/pico-8/carts/
mv -f /roms/pico-8/bbs/carts/*.PNG /roms/pico-8/carts/
mv -f /roms/pico-8/bbs/carts/*.p8 /roms/pico-8/carts/
mv -f /roms/pico-8/bbs/carts/*.P8 /roms/pico-8/carts/

