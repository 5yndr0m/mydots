# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#fastfetch
fastfetch --config astronaut --logo-color-1 white 

export PATH=$PATH:/home/syndrom/.spicetify
eval "$(atuin init zsh)"

export BAT_THEME=gruvbox-dark

eval $(thefuck --alias)

eval "$(starship init zsh)"
