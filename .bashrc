# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

use_color=true


# Unlimited bash history:
HISTSIZE=
HISTFILESIZE=
# Enable history appending:
shopt -s histappend
# Immediately write to history file after each command:
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


alias ls='ls --color=auto --group-directories-first'
alias ll="ls -lh"
alias la="ls -lha"

alias vim=nvim

alias xi="sudo xbps-install"
alias xq="xbps-query -Rs"
alias xr="sudo xbps-remove -R"

alias sdn="sudo shutdown -P now"

alias sync_from_drive="rclone sync googledrive: ~/Drive"
alias sync_to_drive="rclone sync ~/Drive googledrive:"

# start and stop wired internet connection:
alias netstop="sudo ip link set down enp2s0"
alias netstart="sudo ip link set up enp2s0"

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

export PATH="$PATH:$HOME/.local/bin"

# fzf history search when typing ctrl+r:
[ -f /usr/share/doc/fzf/key-bindings.bash ] && source /usr/share/doc/fzf/key-bindings.bash
