# .profile

# Automatically startx on login:
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
