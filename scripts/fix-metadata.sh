#!/bin/bash

MUSIC_DIR="/mnt/storage/Music"

# Check if eyeD3 is installed
if ! command -v eyeD3 &>/dev/null; then
  echo "You need to install eyeD3 first (e.g., with pip or yay)."
  exit 1
fi

# Loop through all MP3 files in MUSIC_DIR
find "$MUSIC_DIR" -type f -iname "*.mp3" | while read -r file; do
  # Get current artist tag
  artist_tag=$(eyeD3 "$file" | grep "artist:" | head -n1 | awk -F': ' '{print $2}')

  if [[ -z "$artist_tag" || "$artist_tag" == "None" ]]; then
    # Get filename (without extension)
    filename=$(basename "$file" .mp3)

    # Parse "Artist - Title" from filename
    if [[ "$filename" =~ ^(.+)\ -\ (.+)$ ]]; then
      artist=$(echo "${BASH_REMATCH[1]}" | xargs)
      title=$(echo "${BASH_REMATCH[2]}" | xargs)

      echo -e "🎧 Tagging: \n  ↳ File:   $file\n  ↳ Artist: $artist\n  ↳ Title:  $title"

      # Apply metadata tags
      eyeD3 --artist="$artist" --title="$title" "$file"
    else
      echo "⚠️  Skipping (bad filename format): $file"
    fi
  fi
done

