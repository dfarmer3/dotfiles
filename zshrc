TERM=screen-256color
export LANG=en_US.UTF-8

# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# oh-my-zsh
export ZSH="/home/dennisfarmer/.oh-my-zsh"
ZSH_THEME="cypher"
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# bindkey -e  # emacs mode
# bindkey -v # vi mode
export KEYTIMEOUT=1

# Auto complete with <tab>
autoload -U compinit
zstyle ':completion:*' menu select
#zstyle ':completion:*' ignored-patterns '(\./|\.\./)'
#zstyle ':completion:*' file-patterns '^(\.\./):source-files' '*:all-files' 
zstyle ':completion:*:*:cd:*' menu yes select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Aliases
alias ls="ls -a --color"
alias mkdir="mkdir -p"
alias cl="clear"
alias cs="cd && clear"
alias 'cd.'="cd .."
alias 'cd..'="cd ../../"

alias dsn="jupyter notebook"
alias dss="spyder"
alias dsa="anaconda-navigator"
alias dsl="jupyter lab"
alias ods="onedrive --synchronize"
alias cdwin="cd /mnt/c/Users/Dennis"
alias dsr="conda activate rstudio && rstudio"

if type gvim > /dev/null 2>&1; then
    alias vim="gvim -v"
fi

# Suffix aliases
alias -s {md,json,txt}=vim
alias -s {pdf}=$PDFVIEWER

# Python conda initialize
__conda_setup="$('/home/dennisfarmer/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dennisfarmer/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dennisfarmer/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dennisfarmer/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Launch TMUX
export TMUXRC="$HOME/.config/tmux/tmuxrc"
alias tmux="tmux -2 -f $TMUXRC"
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach 2>/dev/null || tmux new
fi

