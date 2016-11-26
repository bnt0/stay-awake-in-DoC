#!/usr/bin/env bash
set -o nounset

# Small script to move the cursor every REPEAT_SECS seconds, to prevent Lab
# machines from locking

REPEAT_SECS=20
OFFSET=5       # number of pixels to move the mouse with

# get current mouse location in $X, and $Y
while true; do
    eval $(xdotool getmouselocation --shell)
    xdotool mousemove $[$X+$OFFSET] $[$Y+$OFFSET]
    # invert offset, so the mouse goes back to original position
    OFFSET=$[-$OFFSET]
    sleep $REPEAT_SECS
done
