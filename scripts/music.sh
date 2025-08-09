#!/bin/bash


# Check if *any* session exists
if zellij list-sessions 2>/dev/null | grep -q .; then
  kitty \
    --config ~/.config/kitty/ncmpterm.conf \
    --class musicterm \
    --title Music \
    zellij attach
else
  kitty \
    --config ~/.config/kitty/ncmpterm.conf \
    --class musicterm \
    --title Music \
    zellij --layout ~/.config/zellij/layouts/music.kdl
fi

