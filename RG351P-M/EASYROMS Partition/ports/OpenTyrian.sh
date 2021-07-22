#!/bin/bash

# Main
main () {
    cp /home/ark/.asoundrcfords /home/ark/.asoundrc
    /home/ark/.config/opentyrian/opentyrian --data=/roms/ports/opentyrian/data
    cp /home/ark/.asoundrcbak /home/ark/.asoundrc
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
