#!/usr/bin/env bash

# Pick color
COLOR=$(xcolor) || exit 1

# Copy to clipboard
echo -n "$COLOR" | xclip -selection clipboard

# Convert hex to RGB
R=$((16#${COLOR:1:2}))
G=$((16#${COLOR:3:2}))
B=$((16#${COLOR:5:2}))

# Make a 32x32 PNG filled with the color
ICON_PATH="/tmp/color_icon_${R}_${G}_${B}.png"
convert -size 32x32 xc:"$COLOR" "$ICON_PATH"

# Send desktop notification via D-Bus (notify-send)
notify-send \
    -i "$ICON_PATH" \
    "Color picked" \
    "$COLOR  (RGB: $R, $G, $B)"

