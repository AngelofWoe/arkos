#!/bin/sh
sudo systemctl start openborhotkey.service
cp "$1" /opt/OpenBor/Paks
file="$1"
basefile=$(basename -- $file)
basefilename=${basefile%.*}
if [ ! -f "/home/ark/.config/OpenBor/Saves/${basefilename}.cfg" ]; then
  cp "/opt/OpenBor/Saves/master.cfg" "/opt/OpenBor/Saves/${basefilename}.cfg"
fi
cd /opt/OpenBor/
#sudo ./rg351p-js2xbox --silent -t at_vkb &
LD_LIBRARY_PATH=. ./OpenBOR
rm -rf /opt/OpenBor/Paks/*
sudo kill $(pidof rg351p-js2xbox)
sudo systemctl stop openborhotkey.service
printf "\033c" >> /dev/tty1
