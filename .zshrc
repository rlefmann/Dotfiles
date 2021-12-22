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

[ -f "$HOME/.aliasrc" ]   && source "$HOME/.aliasrc"
[ -f "$HOME/.networkrc" ] && source "$HOME/.networkrc"

bindkey '^R' history-incremental-search-backward

# fzf history search when typing ctrl+r:
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# Use the home key to go to the beginning of the line (alternative: ctrl+a)
# and the end key to go to the end of the line (alternative: ctrl+e)
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# Use Ctrl+Backspace to move up one level in the directory tree:
updirectory() {
	cd ..; zle reset-prompt;
}
zle -N updirectory
bindkey '^\b' updirectory

setopt promptsubst
PROMPT="%B%F{blue}%1~ %# %f%b"
RPROMPT="%F{008}%n@%m %t%f"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
