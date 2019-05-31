# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Automatically startx on login:
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
