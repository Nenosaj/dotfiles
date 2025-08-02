#!/bin/zsh

wal -i ~/HDD/Pictures/makise.jpg --feh

ws="10"

#sleep 0.2
#i3-msg "workspace $ws; exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-browser -e ncmpcpp --screen=browser"
#sleep 0.2
#i3-msg "workspace $ws; exec kitty --directory ~/dotfiles/scripts/ --config ~/.config/kitty/ncmpterm.conf --class npcterm --title yt-search"
#sleep 0.2
#i3-msg "workspace $ws; exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-visualizer -e ncmpcpp --screen=visualizer"

# Load layout into workspace 10 (no need to focus)
i3-msg "append_layout ~/.config/i3/music_layout.json"

exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-browser -e ncmpcpp --screen=browser &
sleep 0.2
exec kitty --directory ~/dotfiles/scripts/ --config ~/.config/kitty/ncmpterm.conf --class npcterm --title yt-search &
sleep 0.2
exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-visualizer -e ncmpcpp --screen=visualizer &

# Launch windows — they will be swallowed into layout containers
#i3-msg "exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-browser -e ncmpcpp --screen=browser"
#sleep 0.2
#i3-msg "exec kitty --directory ~/dotfiles/scripts/ --config ~/.config/kitty/ncmpterm.conf --class npcterm --title yt-search"
#sleep 0.2
#i3-msg "exec kitty --config ~/.config/kitty/ncmpterm.conf --class ncmpterm --title ncmp-visualizer -e ncmpcpp --screen=visualizer"

