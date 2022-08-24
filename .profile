# .profile

export PATH="$PATH:$HOME/.local/bin"

export TERMINAL="alacritty"
export VISUAL="kak"
export EDITOR="kak"
export READER="zathura"
export BROWSER="chromium"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Automatically startx on login:
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || startx
fi
