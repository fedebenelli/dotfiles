#!/bin/sh

h () {
echo "Just a simple timer.
Run this command and as argument the time you desire to count
examples;
simpleclock 20s will show you the time for 20 seconds 
simpleclock 50m will show you the time for 50 minutes
simpleclock 60h will show you the time for 60 hours"
}

[ $# == 0 ] && h && exit 1

# Get the time unit
unit="${1: -1}"
time="${1:0:-1}"
for ((i=1;i<=$time;i++)); do
	figlet $(date +"%H-%M-%S")
	sleep "1$unit"
	clear
done
