#!/bin/bash

sudo cp -f /usr/bin/emulationstation/emulationstation.fullscreen /usr/bin/emulationstation/emulationstation
printf "\033c" | sudo tee -a /dev/tty1 > /dev/null
sudo systemctl restart emulationstation
