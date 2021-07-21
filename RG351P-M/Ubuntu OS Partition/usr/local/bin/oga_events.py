#!/usr/bin/env python3

import evdev
import asyncio
import time
from subprocess import check_output

pwrkey = evdev.InputDevice("/dev/input/event0")
arkos_joypad = evdev.InputDevice("/dev/input/event2")
sound = evdev.InputDevice("/dev/input/event2")

brightness_path = "/sys/devices/platform/backlight/backlight/backlight/brightness"
max_brightness = int(open("/sys/devices/platform/backlight/backlight/backlight/max_brightness", "r").read())

class Power:
    pwr = 116

class Joypad:
    l1 = 308
    r1 = 309

    up = 17
    down = 17
    left = 16
    right = 16

    f1 = 704
    f2 = 705
    f3 = 313


def runcmd(cmd, *args, **kw):
    print(f">>> {cmd}")
    check_output(cmd, *args, **kw)

def brightness(direction):
    with open(brightness_path, "r+") as f:
        cur = int(f.read())
        adj = max(1, int(cur * 0.07))
        cur = max(0, min(cur + adj * direction, max_brightness))
        f.seek(0, 0)
        f.write(f"{cur}")

async def handle_event(device):
    async for event in device.async_read_loop():
        if device.name == "rk8xx_pwrkey":
            keys = arkos_joypad.active_keys()
            if event.value == 1 and event.code == Power.pwr: # pwr
                if Joypad.f3 in keys:
                    runcmd("/bin/systemctl poweroff || true", shell=True)
                else:
                    runcmd("/bin/systemctl suspend || true", shell=True)

        elif device.name == "OpenSimHardware OSH PB Controller":
            keys = arkos_joypad.active_keys()
            #print(keys)
            if Joypad.f3 in keys:
                if event.code == Joypad.up and event.value == -1:
                    brightness(1)
                elif event.code == Joypad.down and event.value == 1:
                    brightness(-1)
                elif event.code == Joypad.l1:
                    runcmd("/usr/local/bin/perfnorm", shell=True)
                elif event.code == Joypad.r1:
                    runcmd("/usr/local/bin/perfmax", shell=True)

        time.sleep(0.001)

def run():
    asyncio.ensure_future(handle_event(pwrkey))
    asyncio.ensure_future(handle_event(arkos_joypad))
    asyncio.ensure_future(handle_event(sound))

    loop = asyncio.get_event_loop()
    loop.run_forever()

if __name__ == "__main__": # admire
    run()

