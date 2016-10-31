#!/bin/bash

# sync local remind w/ caldav &&  update for tmux
rm -f ~/.reminders
/home/bjoernp/.local/bin/dav2rem -r http://localhost:1080/users/bp@cypp.hamburg/calendar -u bp@cypp.hamburg -p <PASSWD> && cp ~/.reminders ~/.tmux/scripts/.reminders
