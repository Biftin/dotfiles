#
# ~/.bash_profile
#

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Default Editor
export EDITOR='nvim'
export SUDO_EDITOR="$EDITOR"

# User-wide NPM packages
PATH="$HOME/.local/bin:$PATH"
export npm_config_prefix="$HOME/.local"

# QT5 Theme
export QT_STYLE_OVERRIDE=Adwaita-Dark

# Wlroots Renderer
export WLR_RENDERER=vulkan

[[ -f ~/.bashrc ]] && . ~/.bashrc
