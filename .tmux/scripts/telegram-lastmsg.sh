#!/bin/bash

starttime=$(date +%H:%M -d '5 minutes ago')

# Replace <User> 
history=`(echo "history <USER>  10"; sleep 0.5;) | nc 127.0.0.1 2391 | grep -E '[[:digit:]]:[[:digit:]]' | grep "»»»" | sed 's/\x1b\[[0-9;]*m//g' | tr -d '[]' | awk -v starttime=${starttime} '$1 > starttime' | awk '{$2="";$3="";$4="";print $0}'`

echo ${history} | wc -c > /tmp/telegram-lastmsg-lenght
echo ${history}
