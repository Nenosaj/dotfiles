#!/bin/zsh

kitty --class ncmpterm --title "ncmp-music" -e tmux new-session -d -s music 'ncmpcpp --screen=browse' \;\
  split-window -v 'ncmpcpp --screen=visualizer' \;\
  split-window -h -t 0 'zsh' \;\
  select-layout even-vertical \;\
  attach-session -t music

