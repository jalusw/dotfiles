#!/bin/sh

# Configure internal display (laptop screen)
xrandr --output eDP-1 --mode 1920x1080 --rate 144 --pos 0x0 --rotate normal

# Configure HDMI-1 display (primary monitor)
xrandr --output HDMI-1 --mode 1920x1080 --rate 180 --pos 1920x0 --rotate normal --primary

# Configure DP-1-1 display (third monitor)
xrandr --output DP-1-1 --mode 1920x1080 --pos 3840x0 --rotate normal

