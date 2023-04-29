# Start Sway on login
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec sway &> /dev/null
fi


################################################################################
#
# Completion settings:
#
autoload -Uz compinit
compinit

zmodload zsh/complist
#
# Menu
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
# 
# Completer settings
zstyle ':completion:*' completer _oldlist _expand _complete _ignored _correct _approximate _files
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
#
# Separate matches into groups
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
#
# Manpage completion
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select
#
# Completion colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
# Expand completion options
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:history-words' list false

################################################################################
#
# General settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep
bindkey -e
#
# Color output
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='exa --color=auto'
alias cat='bat -p'
export LESS='-R --use-color -Dd+r$Du+b'

################################################################################
#
# Aliases:
#
# Manage configuration via Git
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

################################################################################
#
# Prompt:
eval "$(starship init zsh)"
