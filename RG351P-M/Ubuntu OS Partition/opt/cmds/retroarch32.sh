#!/usr/bin/env bash

# Main
main () {
    /usr/local/bin/retroarch32 "$@"
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi