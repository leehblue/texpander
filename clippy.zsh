#!/usr/bin/zsh

# Version: 2.0
# Release: November 24, 2017

# Get window id, pass to getwindow pid to output the pid of current window
pid=$(xdotool getwindowfocus getwindowpid)

# Store text name of process based on pid of current window
proc_name=$(cat /proc/$pid/comm)

name=$(greenclip print|rofi -dmenu -i)

# Put text in primary buffer for Shift+Insert pasting
echo -n "$name" | /usr/bin/xsel -p -i

# Put text in clipboard selection for apps like Firefox that 
# insist on using the clipboard for all pasting
echo -n "$name" | /usr/bin/xsel -b -i

# Paste text into current active window
/usr/bin/sleep 0.3
/usr/bin/xdotool key shift+Insert

# If you're having trouble pasting into apps, use xdotool
# to type into the app instead. This is a little bit slower
# but may work better with some applications.
#
# Make xdotool type RETURN instead of LINEFEED characters 
# otherwise some apps like Gmail in Firefox won't recognize
# newline characters.
#
# To use this, comment out line #32 (xdotool key shift+Insert)
# and uncomment the line below.
#xdotool type -- "$(xsel -bo | tr \\n \\r | sed s/\\r*\$//)"

