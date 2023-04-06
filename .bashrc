#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start Sway on login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec sway
fi

# Color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'

export LESS='-R --use-color -Dd+r$Du+b'

alias cat='bat -p'

# Manage configuration via Git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

eval "$(starship init bash)"