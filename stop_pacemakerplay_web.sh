#!/bin/bash

cd /home/pi/Documents/pacemakerplay_web-1.0-SNAPSHOT

RUNNING_PID=$(cat RUNNING_PID)
kill -9 $RUNNING_PID
rm RUNNING_PID
