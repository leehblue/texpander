#!/bin/bash

base_dir="${HOME}/.texpander/"
abbreviations=$(ls $base_dir | sed -e 's/\..*$//')
name=$(zenity --entry --title="Texpander" --text="Abbreviation\n\n$abbreviations\n")
path=$base_dir$name
path+=".txt"

if [[ $name ]]
then
  #pid=$(xdotool getactivewindow getwindowpid)

  pid=$(xdotool getwindowfocus getwindowpid)
  # zenity --error --text="PID: $pid"

  proc_name=$(cat /proc/$pid/comm)
  # zenity --error --text="Proc name: $proc_name"

  if [ -e "$path" ]
  then
    xclip -selection c -i "$path"

    if [[ $proc_name =~ 'terminal' ]]
    then
      xdotool key ctrl+shift+v
    else
      xdotool key ctrl+v
    fi
  else
    zenity --error --text="Abbreviation not found:\n$name"
  fi
fi
