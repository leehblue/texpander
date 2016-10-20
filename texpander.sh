#!/bin/bash

base_dir="${HOME}/.texpander/"
abbrvs=$(ls $base_dir)
name=$(zenity --list --column=Abbreviations $abbrvs)
path=$base_dir$name

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
