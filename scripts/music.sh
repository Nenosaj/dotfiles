#!/bin/bash


# Check if *any* session exists
if zellij list-sessions 2>/dev/null | grep -q .; then
  # Attach to the only session (since you're only using one)
  kitty \
    --config ~/.config/kitty/ncmpterm.conf \
    --class musicterm \
    --title Music \
    zellij attach
else
  # Start a new session with your layout
  kitty \
    --config ~/.config/kitty/ncmpterm.conf \
    --class musicterm \
    --title Music \
    zellij --layout ~/.config/zellij/layouts/music.kdl
fi

