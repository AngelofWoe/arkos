#!/bin/bash

if  [[ $1 == "standalone" ]]; then
sudo systemctl start ppsspphotkey.service
cp -f /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini.sdl /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini
/opt/ppsspp/PPSSPPSDL --fullscreen "$2"
cp -f /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini.sdl
sudo systemctl stop ppsspphotkey.service
elif [[ $1 == "standalone-go" ]]; then
cp /home/ark/.asoundrcbak /home/ark/.asoundrc
sudo systemctl start ppsspphotkey.service
cp -f /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini.go /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini
/opt/ppssppgo/PPSSPPSDL --fullscreen "$2"
cp -f /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini /roms/psp/ppsspp/PSP/SYSTEM/ppsspp.ini.go
sudo systemctl stop ppsspphotkey.service
else
/usr/local/bin/retroarch -L /home/ark/.config/retroarch/cores/ppsspp_libretro.so "$2"
fi
