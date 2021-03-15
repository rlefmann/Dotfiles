# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000
#unsetopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lefmann/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

bindkey '^R' history-incremental-search-backward

# fzf history search when typing ctrl+r:
[ -f /usr/share/doc/fzf/key-bindings.zsh ] && source /usr/share/doc/fzf/key-bindings.zsh

bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

PROMPT="%B%F{blue}%1~ %# %f%b"
