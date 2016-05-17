#!/bin/bash

# 0,30 * * * * /home/pi/script/check-public-ip-bash-script/check_public_ip.sh 2>&1 /home/pi/script/check-public-ip-bash-script/checkIp.log

OUTPUT_FILE='/home/pi/script/check-private-ip-bash-script/whats_my_ip.txt'
CURRENT_IP_FILE='/home/pi/script/check-private-ip-bash-script/current_ip_address.txt'
EMAIL_RECEIPIENT='colmcarew2@gmail.com'
CURRENT_IP=$(cat $CURRENT_IP_FILE)
IP_ADDRESS=$(ip addr | awk '/inet / {sub(/\/.*/, "", $2); print $2}' | grep 192)
DATE=$(date)

echo "`date` - Adding Private IP to $OUTPUT_FILE"
echo "$DATE - $IP_ADDRESS" >> $OUTPUT_FILE
  if [ "$CURRENT_IP" != "$IP_ADDRESS" ]; then
  	   echo "`date` - IP address has changed from $CURRENT_IP to $IP_ADDRESS"
       echo "IP Address has changed to : $IP_ADDRESS" | mail -s "Your private ip is now : $IP_ADDRESS" - $EMAIL_RECEIPIENT
       echo $IP_ADDRESS > $CURRENT_IP_FILE
  else
  	    echo "`date` - IP address has not changed"
  fi


