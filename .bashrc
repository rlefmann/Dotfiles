# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

use_color=true

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

# fzf history search when typing ctrl+r:
[[ -f /usr/share/doc/fzf/key-bindings.bash ]] && source /usr/share/doc/fzf/key-bindings.bash


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


# Enable history appending instead of overwriting.
shopt -s histappend

PS1="\$(if [[ \$? == 0 ]]; then echo \"\[\033[1;34m\]\"; else echo \"\[\033[1;31m\]\"; fi)[\W]\[\033[0m\] "

export PATH="$PATH:$HOME/.local/bin"
