# .bashrc

# Names of wireless and etheret device:
WIFI=wlp3s0
ETHERNET=enp2s0

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

use_color=true

alias ls='ls --color=auto --group-directories-first'
alias ll="ls -lh"
alias la="ls -lha"
alias rf="rm -rf"

alias vim=nvim

alias xi="sudo xbps-install"
alias xq="xbps-query -Rs"
alias xr="sudo xbps-remove -R"

alias sdn="sudo shutdown -P now"

if [ ! -z $WIFI ]; then
	alias wifi_start="sudo ip link set up $WIFI"
	alias wifi_stop="sudo ip link set down $WIFI"
	alias wifi_scan="sudo iw dev $WIFI scan | grep SSID: | sed 's/^[ \t]*SSID: //'"
	alias wifi_disconnect="sudo killall wpa_supplicant"

	wifi_connect ()
	{
		if [ -f "$1" ]; then
			sudo wpa_supplicant -B -i "$WIFI" -c "$1";
			sudo dhcpcd "$WIFI";
		else
			echo "'$1' is not a valid file"
		fi
	}
fi

# start and stop wired internet connection:
if [ ! -z $ETHERNET ]; then
	alias ethernet_start="sudo ip link set up $ETHERNET"
	alias ethernet_stop="sudo ip link set down $ETHERNET"
fi

alias sync_from_drive="rclone sync googledrive: ~/Drive"
alias sync_to_drive="rclone sync ~/Drive googledrive:"

alias set_time="sudo date +%T -s"

# set the time and date from the internet:
sync_time_from_web ()
{
	sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d' ' -f5-8)Z"
}

# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

# cd to current directory when exiting nnn:
export NNN_TMPFILE="/tmp/nnn"
n()
{
	nnn "$@"
	if [ -f $NNN_TMPFILE ]; then
		. $NNN_TMPFILE
		rm -f $NNN_TMPFILE > /dev/null
	fi
}

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
