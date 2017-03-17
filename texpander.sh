#!/bin/bash

# Version: 1.1.1
# Release: November 22, 2016

base_dir="${HOME}/.texpander/"
format=".txt"
abbrvs=$(ls $base_dir)

found=0
while [ $found -eq 0 ]
do
  name=$(zenity --entry --title=Texpander --text="Enter your filename here:" --entry-text "FileName (without .txt)")

  if [[ $? -eq 1 ]]
  then
    exit
  fi

  path=$base_dir$name$format

  if [ -f $path ]
  then
    found=1
  fi
done

if [[ $name ]]
then
  pid=$(xdotool getwindowfocus getwindowpid)
  proc_name=$(cat /proc/$pid/comm)

  if [ -e "$path" ]
  then
    clipboard=$(xclip -selection clipboard -o)
    xclip -selection c -i "$path"

    if [[ $proc_name =~ (terminal|terminator) ]]
    then
      xdotool key ctrl+shift+v
    else
      xdotool key ctrl+v
    fi

    sleep 1s

    echo $clipboard | xclip -selection c
  else
    zenity --error --text="Abbreviation not found:\n$name"
  fi
fi
