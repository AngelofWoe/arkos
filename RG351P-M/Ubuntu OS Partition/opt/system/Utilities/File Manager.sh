#!/bin/bash

# Main
main () {
    /opt/dingux/DinguxCommander
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
