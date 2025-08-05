#!/bin/sh
set -e
i3lock \
    --image ~/HDD/Pictures/makisecool.png \
      --clock \
        --time-color=ffffffff \
          --date-color=ffffffff \
            --date-str="I shall return ~" \
              --inside-color=00000088 \
                --ring-color=ffffff88 \
                  --line-color=00000000 \
                    --separator-color=00000000 \
                      --indicator \
                        --ignore-empty-password \
                          --show-failed-attempts \
                            --nofork
xset dpms

