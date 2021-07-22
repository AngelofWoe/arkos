#!/bin/bash

# Main
main () {
    c_brightness="$(cat /sys/devices/platform/backlight/backlight/backlight/brightness)"
    sudo nmcli n on
    echo 3 > /sys/class/backlight/backlight/brightness
    sleep 1
    echo "${c_brightness}" > /sys/class/backlight/backlight/brightness
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
