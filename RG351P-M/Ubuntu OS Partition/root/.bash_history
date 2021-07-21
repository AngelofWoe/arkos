cat /sys/devices/platform/odroidgo2-joypad/poll_interval 
echo 10 >  /sys/devices/platform/odroidgo2-joypad/poll_interval
cat /sys/devices/platform/odroidgo2-joypad/poll_interval 
nano
sudo nano /etc/rc.local
sudo reboot
cat /sys/devices/platform/odroidgo2-joypad/poll_interval 
exit
