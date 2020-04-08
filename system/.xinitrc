# set keymap for german keyboard:
setxkbmap -layout de -option caps:escape

# remap numpad keys for easier access to backslash and left and right braces:
xmodmap -e "keycode 90 = backslash"
xmodmap -e "keycode 86 = braceleft"
xmodmap -e "keycode 104 = braceright"

udevil

# set the background:
xsetroot -solid "#005577"

sh ~/.local/bin/dwmstatus.sh &
exec dwm

# restore ALSA settings for headphones to work on startup:
FILE="/home/lefmann/.config/asound.state"
if [ -f "$FILE" ]; then
	alsactl --file "$FILE" restore
fi
