# .profile

export TERMINAL="st"
export EDITOR="nvim"
export READER="zathura"
export BROWSER="surf"

# Automatically startx on login:
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
