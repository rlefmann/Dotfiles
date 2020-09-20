# .profile

export PATH="$PATH:$HOME/.local/bin"

export TERMINAL="st"
export VISUAL="nvim"
export EDITOR="nvim"
export READER="zathura"
export BROWSER="vimb"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Automatically startx on login:
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
