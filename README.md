<p align="left"><img width="200" height="100" src="https://github.com/AngelofWoe/arkos/raw/main/devices/ArkOSLogoOreoTransparent.bmp">
</p>
Another rk3326 Operating System

See the [ArkOS Wiki](https://github.com/AngelofWoe/arkos/wiki) for more information and link to images.

This project was forked from [ArkOS](https://github.com/christianhaitian/arkos) by [christianhaitian](https://github.com/christianhaitian)

I highly recommend you install these projects:

* [ThemeMaster](https://github.com/JohnIrvine1433/ThemeMaster) by [JohnIrvine1433](https://github.com/JohnIrvine1433)
* [AnberPorts](https://github.com/krishenriksen/AnberPorts) by [krishenriksen](https://github.com/krishenriksen)

* Overlay packages:
  - [Jdan-S and ByEthanFox](https://retrogamecorps.files.wordpress.com/2021/02/rg351p-handheld-overlays-2020012.zip)
  - [Another MegaPack by Jdan-S](https://www.reddit.com/r/RG351/comments/m7vnnb/rg351pm_overlay_megapack_crt_handheld_super_game/)
  - [IAmTheDewd's SGB Overlays](https://www.reddit.com/r/RG351/comments/mhjmem/sgb_overlays_for_gbgbc_479_total/)

[Retro Game Corps](https://retrogamecorps.com) has excellent guides:

* [RG351* Guide List Page](https://retrogamecorps.com/rg351/)
* [ArkOS Installation and Walkthrough](https://retrogamecorps.com/2020/11/15/arkos-rg351p-guide/)
* [AnberPorts](https://retrogamecorps.com/2021/02/10/anberports-for-rg351-devices-diablo-ii-moonlight-stadia-and-more/)
* [Screen Configuration](https://retrogamecorps.com/2020/10/24/rg351p-screen-configuration-guide/)
* [Handheld Screen Settings](https://retrogamecorps.com/2021/01/28/guide-handheld-screen-settings-for-rg351-devices/)

Changes from [christianhaitian's](https://github.com/christianhaitian) [ArkOS](https://github.com/christianhaitian/arkos):

* System changes
  * Alterations to the Options menu and scripts to reduce number of scripts needed, to improve some of the stability, and to make them slightly more user friendly, at least for me. Most of the connectivity and similar settings have been split up and made into toggles.
  * Addition of a battery LED fix service that attempts to fix the battery LED on the RG351P/M until it is registered in the system properly
  * An emergency shutdown at 15% battery remaining (I ran into multiple issues with the system powering off suddenly at 9-12% battery life as the battery drops below usable voltage and the system doesn't shut down properly, sometimes damaging the file system and always losing the save progress).
  * Lots of little file ownership changes.
  * Tons of changes to scripts running games and such to try and improve some stability issues as well as better follow modern bash guidelines.
  * Switch to zsh as the default user shell instead of bash.
  * Making lots of repeated code functions so they can be combined into includable universal scripts later.
* Retroarch
  * Updated to 1.9.6
  * Most systems have had auto-savestates enabled when quitting Retroarch/Retroarch32, so that when the system shuts down your current state is saved.
  * Rewind/Fast-forward are enabled and have hotkeys configured. Holding select + L2 rewinds and select + R2 toggles fast foward.
  * Most of the settings recommendations at [Retro Game Corps](https://retrogamecorps.com) have been applied.
* AnberPorts
  * I haven't requested permission from the AnberPorts developer to include their scripts in here so I have not, but I have rewritten some of their scripts slightly to more of my liking. They're currently in the [roms/ports](https://github.com/AngelofWoe/arkos/tree/main/RG351P-M/EASYROMS%20Partition/ports) folder here. The changes are very minimal, [krishenriksen](https://github.com/krishenriksen) has a very nice scripting style.
* Themes
  * Themes installed by default have been updated to the most recent versions.
