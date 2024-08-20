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
source_if_exits() {
    [[ -f $1 ]] && source $1
}

### Plugins ###
source_if_exits ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source_if_exits ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source_if_exits ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme # Prompt theming

### Alias ###
source_if_exits ~/.aliases

### Environment variables ###
[ -f /usr/bin/nvim ] && export EDITOR=nvim  # Default editor
[ -d "$HOME/.local/bin" ] && \
    [[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && \
    export PATH="$HOME/.local/bin:$PATH" # PATH variable
export ELECTRON_OZONE_PLATFORM_HINT=auto # Compatibilidad electron con Wayland

### Terminal ###
source_if_exits ~/.zsh-config # Use powerline
source_if_exits ~/.config/zellij/zellij_zsh.sh # load Zellij if exists
source_if_exits ~/.config/poetry/poetry_zsh.sh # poetry autocompletion
source_if_exits ~/.config/kitty/kitty_zsh.sh # load Kitty configuration
source_if_exits ~/.config/zoxide/zoxide_zsh.sh # load zoxide configuration
source_if_exits ~/.p10k.zsh # load p10k config
