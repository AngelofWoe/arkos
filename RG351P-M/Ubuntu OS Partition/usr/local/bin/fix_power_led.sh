#!/bin/bash

# ledfix
ledfix () {
    echo 77 | sudo tee /sys/class/gpio/export > /dev/null
    echo out | sudo tee /sys/class/gpio/gpio77/direction > /dev/null
    echo 0 | sudo tee /sys/class/gpio/gpio77/value > /dev/null
}

# Main
main () {
    while ! [[ -d /sys/class/gpio/gpio77 ]] || ! [[ -f /sys/class/gpio/gpio77/direction ]] || ! [[ -f /sys/class/gpio/gpio77/value ]]; do
        ledfix
        sleep 30
    done
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
