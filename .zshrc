# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Color para ls
if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -p dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi
fi

# export LS_COLORS=$LS_COLORS

# Use powerline
if [[ -e ~/.zsh-config ]]; then
  source ~/.zsh-config
fi

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Alias
[ -f $HOME/.aliases ] && . $HOME/.aliases
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Variables de entorno
export EDITOR=nvim

# Variable para arreglar problema con TOR
# export QT_QPA_PLATFORM=wayland
#
# Problema Firefox is alredy running
# export MOZ_DBUS_REMOTE = 1

# Golang
# export GOPATH=$HOME/.go
# export PATH=$PATH:$GOPATH/bin

# Starship
#eval "$(starship init zsh)"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zellij autostart
export ZELLIJ_AUTO_EXIT=true
[ $TERM = "xterm-256color" ] && [ ! -n "$SSH_CLIENT" ] && [ $EUID -ne 0 ] && eval "$(zellij setup --generate-auto-start zsh)"
eval "$(zoxide init --cmd cd zsh)"

# PATH
# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Poetry autocompletion
fpath+=~/.zfunc
autoload -Uz compinit && compinit
