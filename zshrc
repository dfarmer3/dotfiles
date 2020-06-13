# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/dennisfarmer/.oh-my-zsh"

ZSH_THEME="cypher"
TERM=screen-256color


# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias ls="ls -a --color"
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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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
# <<< conda initialize <<<

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"




# Launch TMUX
export TMUXRC="$HOME/.config/tmux/tmuxrc"

alias tmux="tmux -2 -f $TMUXRC"


if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach || tmux new
fi

#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit; }
#tmux attach -t default || tmux new -s default
