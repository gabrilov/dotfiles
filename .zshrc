#      _____  ____    _   _   ____     ____
#     |__  / / ___|  | | | | |  _ \   / ___|
#       / /  \___ \  | |_| | | |_) | | |
#  _   / /_   ___) | |  _  | |  _ <  | |___
# (_) /____| |____/  |_| |_| |_| \_\  \____|


### History ###
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

### Aux function ###
check_and_source() {
    [[ -f $1 ]] && source $1
}

### Plugins ###
check_and_source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
check_and_source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
check_and_source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme # Prompt theming

### Alias ###
check_and_source ~/.aliases

### Environment variables ###
[ -f /usr/bin/nvim ] && export EDITOR=nvim  # Default editor
[ -d "$HOME/.local/bin" ] && \
    [[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && \
    export PATH="$HOME/.local/bin:$PATH" # PATH variable

### Terminal ###
check_and_source ~/.zsh-config # Use powerline
check_and_source ~/.config/zellij/zellij_zsh.sh # load Zellij if exists
check_and_source ~/.config/tmux/tmux_zsh.sh # load Tmux if exists
check_and_source ~/.config/poetry/poetry_zsh.sh # poetry autocompletion
check_and_source ~/.config/kitty/kitty_zsh.sh # load Kitty configuration
check_and_source ~/.config/zoxide/zoxide_zsh.sh # load zoxide configuration
check_and_source ~/.p10k.zsh # load p10k config
