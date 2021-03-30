# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

use_color=true

[ -f "$HOME/.aliasrc" ]   && source "$HOME/.aliasrc"
[ -f "$HOME/.networkrc" ] && source "$HOME/.networkrc"

alias sync_from_drive="rclone sync googledrive: ~/Drive"
alias sync_to_drive="rclone sync ~/Drive googledrive:"


# set the brightness of the primary display:
brightness() {
	OUTPUTNAME=`xrandr | grep " connected primary " | awk '{ print $1 }'`
	xrandr --output $OUTPUTNAME --brightness "$1"
}

# enable vi mode:
set -o vi

PS1="\$(if [[ \$? == 0 ]]; then echo \"\[\033[1;34m\]\"; else echo \"\[\033[1;31m\]\"; fi)[\W]\[\033[0m\] "

# fzf history search when typing ctrl+r:
[ -f /usr/share/doc/fzf/key-bindings.bash ] && source /usr/share/doc/fzf/key-bindings.bash

# With a dircolors you can change the appearance of
# directories in the shell. To create a dircolors file run
# dircolors --print-database > ~/.dircolors
[ -f $HOME/.dircolors ] && eval "`dircolors $HOME/.dircolors`"

# Unlimited bash history:
HISTSIZE=-1
HISTFILESIZE=-1
# Enable history appending:
shopt -s histappend
# Change the file location because certain bash sessions truncate .bash_history file upon close:
export HISTFILE=~/.bash_eternal_history
# Immediately write to history file after each command:
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

[ -f $HOME/.bash_env ] && source $HOME/.bash_env
