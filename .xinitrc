#!/bin/sh

# set keymap for german keyboard:
setxkbmap -layout de -option caps:escape

# remap numpad keys for easier access to backslash and left and right braces:
xmodmap -e "keycode 90 = backslash"
xmodmap -e "keycode 86 = braceleft"
xmodmap -e "keycode 104 = braceright"

udevil

# read .Xresources:
[ -f $HOME/.Xresources ] && xrdb $HOME/.Xresources

# set the background:
xsetroot -solid "#111111"

exec openbox-session

# restore ALSA settings:
ALSAFILE="/home/lefmann/.config/asound.state"
if [ -f "$ALSAFILE" ]; then
	alsactl --file "$ALSAFILE" restore
fi
