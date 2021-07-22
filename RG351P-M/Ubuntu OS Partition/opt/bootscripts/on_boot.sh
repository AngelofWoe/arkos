#!/usr/bin/env bash

# Main
main () {
    sudo chmod 777 /sys/class/gpio/export
    echo 77 | sudo tee /sys/class/gpio/export > /dev/null
    sudo chmod 777 /sys/class/gpio/gpio77/direction
    echo out | sudo tee /sys/class/gpio/gpio77/direction > /dev/null
    sudo chmod 777 /sys/class/gpio/gpio77/value
    echo 0 | sudo tee /sys/class/gpio/gpio77/value > /dev/null
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
