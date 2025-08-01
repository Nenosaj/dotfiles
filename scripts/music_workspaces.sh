#!/bin/zsh

wal -i ~/HDD/Pictures/makise.jpg --feh

ws="10"

sleep 0.2

i3-msg "workspace $ws; exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-browser -e ncmpcpp --screen=browser"

sleep 0.2

i3-msg "workspace $ws; exec kitty --directory ~/dotfiles/scripts/ --config ~/.config/kitty/ncmpterm.conf --class npcterm --title yt-search"

sleep 0.2

i3-msg "workspace $ws; exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-visualizer -e ncmpcpp --screen=visualizer"




