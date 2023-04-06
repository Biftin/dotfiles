if status is-interactive
    # Dotfiles management
    alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
end

# Disable greeting message
set -g fish_greeting

# Use starship prompt
starship init fish | source
