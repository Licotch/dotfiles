#!/bin/bash
if xrandr | grep "HDMI1 connected"; then
    xrandr --output HDMI1 --auto --right-of eDP1
else
    xrandr --output HDMI1 --off
fi

~/.fehbg
