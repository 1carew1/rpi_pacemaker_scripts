#!/bin/bash

CURRENT_TEMP=$(/opt/vc/bin/vcgencmd measure_temp | cut -d'=' -f 2 | cut -d"." -f 1)
MAX_TEMP=65
EMAIL_RECIPIENT='colmcarew2@gmail.com'

if [ $("$CURRENT_TEMP"/"$MAX_TEMP") -ge 1]; then
	mail -s "Temp over 65 on $HOSTNAME" - $EMAIL_RECIPIENT
fi
