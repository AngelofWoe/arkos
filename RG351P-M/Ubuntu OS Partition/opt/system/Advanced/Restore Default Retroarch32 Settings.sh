#!/bin/bash

sudo rg351p-js2xbox --silent -t oga_joypad &
sudo ln -s /dev/input/event3 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick
sudo chmod 777 /dev/input/by-path/platform-odroidgo2-joypad-event-joystick

sudo msgbox "This process will restore the default retroarch32 settings.  Use this if you can't open the retroarch32 menu anymore.  Be aware that any global setting changes you've changed will be reverted to the default settings as initially set from the most recent update."
my_var=`osk "Enter OK here to proceed." | tail -n 1`

if [[ $my_var = OK ]] || [[ $my_var = ok ]] ; then
  cp /home/ark/.config/retroarch32/retroarch.cfg.bak /home/ark/.config/retroarch32/retroarch.cfg
else
  sudo msgbox "You didn't type OK.  This script will exit now and no changes have been made from this process."
  printf "You didn't type OK.  This script will exit now and no changes have been made from this process." | tee -a "$LOG_FILE"
fi

sudo kill $(pidof rg351p-js2xbox)
sudo rm /dev/input/by-path/platform-odroidgo2-joypad-event-joystick