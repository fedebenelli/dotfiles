#!/bin/sh

ffmpeg -i $1 -vcodec libx265 -crf 20 output.mp4
