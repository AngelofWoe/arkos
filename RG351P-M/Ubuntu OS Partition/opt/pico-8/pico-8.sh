#!/bin/bash
sudo systemctl start pico8hotkey
/roms/bios/pico-8/pico8_dyn -splore -home /roms/bios/pico-8 -root_path /roms/ports/pico-8 -joystick 0
sudo systemctl stop pico8hotkey
