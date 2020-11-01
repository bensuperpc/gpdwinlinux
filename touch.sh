#!/bin/sh
xrandr -o right
xinput set-prop "pointer:Goodix Capacitive TouchScreen" --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
