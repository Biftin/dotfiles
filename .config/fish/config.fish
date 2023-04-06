if status is-interactive
    # Dotfiles management
    alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
end

# Use starship prompt
starship init fish | source
