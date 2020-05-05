# .profile

export PATH="$PATH:$HOME/.local/bin"

export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="nvim"
export READER="zathura"
export BROWSER="vimb"

# Automatically startx on login:
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
