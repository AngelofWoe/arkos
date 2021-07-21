#!/bin/bash
sudo cp -v /usr/local/bin/perfnorm.pic /usr/local/bin/perfnorm
sudo cp -v /usr/local/bin/perfmax.pic /usr/local/bin/perfmax
sudo chmod 777 /usr/local/bin/perfnorm
sudo chmod 777 /usr/local/bin/perfmax
sudo cp /usr/local/bin/Switch\ Launchimage\ to\ ascii.sh /opt/system/.
sudo rm /opt/system/Switch\ Launchimage\ to\ jpg.sh
printf "\033c" >> /dev/tty1
sudo systemctl restart emulationstation
