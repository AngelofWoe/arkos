#!/bin/bash

if  [[ $1 == "standalone-Rice" ]]; then
/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /opt/mupen64plus --gfx mupen64plus-video-rice.so --corelib /opt/mupen64plus/libmupen64plus.so.2 --datadir /opt/mupen64plus "$2"
elif [[ $1 == "standalone-Glide64mk2" ]]; then
/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /opt/mupen64plus --gfx mupen64plus-video-glide64mk2.so --corelib /opt/mupen64plus/libmupen64plus.so.2 --datadir /opt/mupen64plus "$2"
else
/usr/local/bin/"$1" -L /home/ark/.config/"$1"/cores/"$2"_libretro.so "$3"
fi
