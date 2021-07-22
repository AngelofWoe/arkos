#!/usr/bin/env python3

import os
import sys
import time

batt_life = "/sys/class/power_supply/battery/capacity"
pwr_led = "/sys/class/gpio/gpio77/value"

led_green = 0
led_red = 1

while(True):
    current_led_color = int(open(pwr_led, "r").read())
    current_batt_level = int(open(batt_life, "r").read())

    if current_batt_level <= 25:  # If battery life is <=25%
        # Blink LED
        if current_led_color == led_green:
            f = open(pwr_led, "w")
            f.write("1")
            f.close()
        elif current_led_color == led_red:
            f = open(pwr_led, "w")
            f.write("0")
            f.close()
        # Blink faster if battery is lower
        if current_batt_level <= 20:
            time.sleep(.25)
        else:
            time.sleep(.5)
    elif current_batt_level <= 35:  # If battery life is <=35% set LED red
        if current_led_color != led_red:
            f = open(pwr_led, "w")
            f.write("1")
            f.close()
        time.sleep(10)
    elif current_batt_level > 30:  # If battery life is >30% set LED green
        if current_led_color != led_green:
            f = open(pwr_led, "w")
            f.write("0")
            f.close()
        # Check more often as level gets lower
        if current_batt_level <= 40:
            time.sleep(15)
        elif current_batt_level > 40:
            time.sleep(30)
