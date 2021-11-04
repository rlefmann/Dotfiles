#!/bin/sh

# set keymap for german keyboard:
setxkbmap -layout de -option caps:escape

# remap numpad keys for easier access to backslash and left and right braces:
xmodmap -e "keycode 90 = backslash"
xmodmap -e "keycode 86 = braceleft"
xmodmap -e "keycode 104 = braceright"

udevil

# Shutdown computer at 11pm and prohibit it from
# starting between 10pm and 5am
sudo shutdown -P 23:00 &
time=$(date '+%H')
if [ "$time" -gt 22 ] || [ "$time" -lt 5 ]; then
	sudo shutdown -P now
fi

# read .Xresources:
[ -f $HOME/.Xresources ] && xrdb $HOME/.Xresources

# set the background:
xsetroot -solid "#101a26"

exec openbox-session

# restore ALSA settings:
ALSAFILE="/home/lefmann/.config/asound.state"
if [ -f "$ALSAFILE" ]; then
	alsactl --file "$ALSAFILE" restore
fi
