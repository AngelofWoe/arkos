#!/bin/bash
export SDL_GAMECONTROLLERCONFIG="$(cat /roms/ports/sdlpop/gamecontrollerdb.txt)"
/roms/ports/sdlpop/prince
unset SDL_GAMECONTROLLERCONFIG