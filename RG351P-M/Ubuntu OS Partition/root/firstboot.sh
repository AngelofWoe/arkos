#!/bin/bash
chown root:adm /sys/devices/platform/ff400000.gpu/devfreq/ff400000.gpu/governor
chmod g+w /sys/devices/platform/ff400000.gpu/devfreq/ff400000.gpu/governor
chown root:adm /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
chmod g+w /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
chown root:adm /sys/devices/platform/dmc/devfreq/dmc/governor
chmod g+w /sys/devices/platform/dmc/devfreq/dmc/governor

echo 10 > /sys/devices/platform/odroidgo2-joypad/poll_interval

if [ -f /.first_boot ]; then
    # Regenerate ssh keys
    systemctl stop sshd
    rm -v /etc/ssh/ssh_host_*
    dpkg-reconfigure openssh-server
    systemctl start sshd


    # Create default ethernet connection
    #nmcli c a type ethernet ifname eth0 autoconnect yes 802-3-ethernet.auto-negotiate no 802-3-ethernet.speed 100 802-3-ethernet.duplex full
    nmcli c a type ethernet ifname eth0 autoconnect yes


    # Regenerate uInitrd
    mount /dev/mmcblk0p1 /mnt
    INITRD="$(update-initramfs -u | awk '{print $3}')"
    mkimage -A arm -O linux -T ramdisk -a 0x0 -n "uInitrd" -d $INITRD /mnt/uInitrd
    umount /mnt


    # Mixer settings
    amixer set 'Playback Path' 'SPK'
    alsactl store


    # Resize filesystem
    dev_p2=`blkid -U e139ce78-9841-40fe-8823-96a304a09859`
	dev=${dev_p2%??}

	p2_start=`fdisk -l $dev | grep $dev_p2 | awk '{print $2}'`

	fdisk -W never $dev <<-EOF >> /resize.log
p
d
2
n
p
2
$p2_start

p
w
EOF

    resize2fs $dev_p2
    rm -fr /.first_boot
    sync

    #reboot
fi

