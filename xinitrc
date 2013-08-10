#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


# Pulls wallpapers from .wallpaper and shuffles between them every X minutes.
sh ~/.wallpaper/random.sh &

xsetroot -cursor_name left_ptr
xrdb -load ~/.Xresources

exec xmonad
