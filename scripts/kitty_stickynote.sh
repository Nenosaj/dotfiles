#!/bin/bash

# Configurable parameters
CLASS_NAME="stickynote"
WIDTH=600
HEIGHT=400
X_POS=50
Y_POS=50
WORKSPACE="1"

# Launch Kitty with a custom class
kitty --class "$CLASS_NAME" &

# Wait until the window appears
while ! xdotool search --class "$CLASS_NAME" >/dev/null 2>&1; do
    sleep 0.1
done

# Get the window ID
WIN_ID=$(xdotool search --class "$CLASS_NAME" | head -n 1)

# Move to workspace, float, resize, move, and make sticky
i3-msg "[id=$WIN_ID]" move to workspace "$WORKSPACE"
i3-msg "[id=$WIN_ID]" floating enable
i3-msg "[id=$WIN_ID]" resize set $WIDTH $HEIGHT
i3-msg "[id=$WIN_ID]" move position $X_POS $Y_POS
i3-msg "[id=$WIN_ID]" sticky enable
i3-msg workspace "$WORKSPACE"

