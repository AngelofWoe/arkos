#!/bin/bash
sudo rg351p-js2xbox --silent -t oga_joypad &
sleep 1
sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
sleep 1
sudo chmod 777 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
sleep 1
sudo chmod 666 /dev/tty1
sleep 1
/boot/expandtoexfat.sh > /dev/tty1 2>&1
