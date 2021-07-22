#!/bin/bash

# ledfix
ledfix () {
    echo 77 | sudo tee /sys/class/gpio/export > /dev/null
    echo out | sudo tee /sys/class/gpio/gpio77/direction > /dev/null
    echo 0 | sudo tee /sys/class/gpio/gpio77/value > /dev/null
}

# Main
main () {
    printf "\033c" | sudo tee -a /dev/tty1 > /dev/null
    printf "\n\e[32mAttempting to fix Battery LED. Please wait...\n"
    if ! [[ -d /sys/class/gpio/gpio77 ]] || ! [[ -f /sys/class/gpio/gpio77/direction ]] || ! [[ -f /sys/class/gpio/gpio77/value ]]; then
        ledfix
        printf "\n\e[32mAttempt Complete\n"
    else
        printf "\n\e[32mBattery LED IO is taken or LED is working\n"
    fi
    sleep 5
    printf "\033c" | sudo tee -a /dev/tty1 > /dev/null
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
