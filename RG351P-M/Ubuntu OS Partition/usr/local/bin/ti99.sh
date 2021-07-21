#!/bin/bash
sudo systemctl start ti99hotkey
cd /opt/ti99sim/bin
sleep 2
./ti99sim-sdl -f --console=/roms/bios/ti-994a.ctg "$1"
sudo systemctl stop ti99hotkey

