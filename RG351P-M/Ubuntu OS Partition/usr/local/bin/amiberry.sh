#!/usr/bin/env bash

# Main
main () {
    pushd "/opt/amiberry/" >/dev/null || exit

    filename=$( basename -- "${1}" )
    extension="${filename##*.}"
    filename="${filename%.*}"

    if [[ $extension == "lha" ]]; then
        /opt/amiberry/amiberry --autoload "${1}"
    else
        /opt/amiberry/amiberry -G -0 "${1}"
    fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
