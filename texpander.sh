#!/bin/bash

base_dir="${HOME}/.texpander/"
name=$(zenity --entry --title="Text Expansion" --text="Abbreviation")
path=$base_dir$name
path+=".txt"

if [[ $name ]]
then
  pid=$(xdotool getactivewindow getwindowpid)
  proc_name=$(cat /proc/$pid/comm)


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

