# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Use powerline
if [[ -e ~/.zsh-config ]]; then
  source ~/.zsh-config
fi

# Plugins
source ~/.local/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme # Prompt theming

# Alias
[ -f $HOME/.aliases ] && . $HOME/.aliases

# Environment variables
[ -f /usr/bin/nvim ] && export EDITOR=nvim

# Terminal
source ~/.config/zellij/zellij_zsh.sh # load Zellij if exists
source ~/.config/tmux/tmux_zsh.sh # load Tmux if exists
source ~/.config/poetry/poetry_zsh.sh # poetry autocompletion

# Path
[ -d "$HOME/.local/bin" ] && \
    [[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && \
    export PATH="$HOME/.local/bin:$PATH"

