#!/bin/sh

DEFAULT_MIC="$(pacmd list-sources | grep -A 1 '\* index:' | grep -o "<.*>" | sed 's,[<>],,g')"
DEFAULT_SINK="$(pacmd list-sinks | grep -A 1 '\* index:' | grep -o "<.*>" | sed 's,[<>],,g')"

ns=$(pactl load-module module-null-sink sink_name=sound_share format=s16le rate=16000 channels=1)
l1=$(pactl load-module module-loopback source=$DEFAULT_MIC sink=sound_share)
l2=$(pactl load-module module-loopback source=$DEFAULT_SINK.monitor sink=sound_share)



