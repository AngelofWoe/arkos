#!/bin/bash

if  [[ $1 == "retroarch" ]]; then
/usr/local/bin/"$1" -L /home/ark/.config/"$1"/cores/"$2"_libretro.so "$3"
elif [[ $1 == "retroarch32" ]]; then
/usr/local/bin/"$1" -L /home/ark/.config/"$1"/cores/"$2"_libretro.so "$3"
elif [[ $1 == "retrorun" ]]; then
sudo rg351p-js2xbox --silent -t oga_joypad &
sleep 1
sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
sudo chmod 777 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
/usr/bin/retrorun -n -s /roms/saturn -d /roms/bios /home/ark/.config/retroarch/cores/"$2"_libretro.so "$3"
sudo kill $(pidof rg351p-js2xbox)
sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
else
sudo rg351p-js2xbox --silent -t oga_joypad &
sleep 1
sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
sudo chmod 777 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
/usr/bin/retrorun32 -n -s /roms/saturn -d /roms/bios /home/ark/.config/retroarch32/cores/"$2"_libretro.so "$3"
sudo kill $(pidof rg351p-js2xbox)
sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
fi
