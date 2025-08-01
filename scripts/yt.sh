#!/bin/bash

MUSIC_DIR="/mnt/storage/Music"

read -rp "Search YouTube: " search

# Make sure yt-dlp and fzf are installed
for cmd in yt-dlp fzf mpc; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "$cmd is not installed. Please install it first."
    exit 1
  fi
done

selection=$(yt-dlp "ytsearch10:$search" --flat-playlist --print "%(id)s|%(title)s" | fzf --prompt="🎵 Select track: ")


[ -z "$selection" ] && echo "Cancelled." && exit

video_id=$(echo "$selection" | cut -d'|' -f1)
title=$(echo "$selection" | cut -d'|' -f2-)

url="https://www.youtube.com/watch?v=$video_id"

echo "Selected URL: $url"

if ls "$MUSIC_DIR"/*"$video_id"*.mp3 &>/dev/null; then
  echo "⚠️ Already downloaded: https://www.youtube.com/watch?v=$video_id"
  exit 0
fi

# Download audio
yt-dlp -x \
  --audio-format mp3 \
  --embed-thumbnail \
  --add-metadata \
  -o "$MUSIC_DIR/%(title)s.%(ext)s" \
  "$url"

# Update MPD library
mpc update

echo "✅ Done! Track added to your library. Play it in ncmpcpp 🎶"

