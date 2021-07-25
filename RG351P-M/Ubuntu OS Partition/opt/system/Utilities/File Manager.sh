#!/bin/bash

# Main
main () {
    printf "\033c" >> /dev/tty1
    clear
    /opt/dingux/DinguxCommander
    clear
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
