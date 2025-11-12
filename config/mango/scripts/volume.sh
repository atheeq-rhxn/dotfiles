#!/bin/bash

if [ "$1" = "up" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+
elif [ "$1" = "down" ]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-
fi