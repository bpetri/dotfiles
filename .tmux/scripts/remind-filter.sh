#!/bin/bash 


IFS=$'\n'

starttime=$(date +%H:%M)
startdate=$(date +%Y/%m/%e)

reminders=$(remind -b1 -n ~/.tmux/scripts/.reminders | sort |  awk  -v startday=${startdate} -v starttime=${starttime} '$1 > startday || ($1 == startday && $2 >= starttime)' |head -n 1)

tglen=0

if [ -e /tmp/telegram-lastmsg-lenght ]; then
  tglen=$(cat /tmp/telegram-lastmsg-lenght)
fi

if [ ${tglen} -gt 30 ]; then
   echo ${reminders} | awk '{print $1 " " $2}'
else  
   echo ${reminders}
 fi
