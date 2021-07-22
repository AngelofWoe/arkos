#!/bin/bash

# Main
main () {
  if  [[ "${1}" == "standalone" ]]; then

    dir="${2}"
    basedir=$(basename -- "${dir}")
    basefilename="${basedir%.*}"

    if [ -f "${dir}/${basefilename}.commands" ]; then
      extraparams=$(<"${dir}/${basefilename}.commands")
    fi

    cp /home/ark/.asoundrcfords /home/ark/.asoundrc
    cd /opt/hypseus/ || exit

    ./hypseus "${basefilename}" vldp -framefile "${dir}/${basefilename}.txt" -fullscreen -useoverlaysb 2 "${extraparams}"

    rm ./*.csv
    cp /home/ark/.asoundrcbak /home/ark/.asoundrc
  else
    /usr/local/bin/"${1}" -L /home/ark/.config/"${1}"/cores/"${2}"_libretro.so "${3}"
  fi
}

# Make sure script is running directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
