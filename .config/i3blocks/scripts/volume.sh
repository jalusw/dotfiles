#!/usr/bin/env bash

# Find default sink
SINK=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Get volume and mute status
VOL=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | head -n 1)
MUTE=$(pactl get-sink-mute "$SINK" | awk '{print $2}')

# Display icon and volume
if [ "$MUTE" = "yes" ]; then
    echo "🔇"
else
    echo "$VOL"
fi

