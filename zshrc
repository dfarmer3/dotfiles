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
alias ls='ls --all --almost-all --color'
alias mkdir='mkdir -p'
alias cl='clear'
alias 'cd.'='cd ..'
alias 'cd..'='cd ../../'
alias cs='f(){ cd "$1" && clear; if [ -z "$1" ]; then { cd; } else { ls; } fi; unset -f f; }; f'
alias 'cs.'='cs .'
alias wget='wget --no-hsts'
alias mkdircd='f(){ mkdir -p "$1" && cd "$1"; unset -f f }; f'

alias bashinit='f(){ if [ -s "$1" ]; then { sed -i. "1s|^|#!/usr/bin/env bash\n|" "$1"; } else { echo "#!/usr/bin/env bash" >> "$1"; } fi; chmod +x "$1"; gvim -v "$1"; unset -f f }; f'
alias pyinit='f(){ if [ -s "$1" ]; then { sed -i. "1s|^|#!/usr/bin/env python\n|" "$1"; } else { echo "#!/usr/bin/env python" >> "$1"; } fi; chmod +x "$1"; gvim -v "$1"; unset -f f }; f'

# ssh/onedrive/wsl
alias sshpi='ssh pi@192.168.1.246'
alias ods='onedrive --synchronize'
alias cdwin='cd /mnt/c/Users/Dennis'
alias cps='cd /run/media/dennisfarmer/Samsung-USB/coursework/c++'
#alias spotify="flatpak run com.spotify.Client"
alias vish="vim ~/github/dotfiles/install.sh"
alias jsontool="python -m json.tool"

alias dsa='anaconda-navigator'

# conda activate [...] changes $HOST to "x86_64-conda_cos6-linux-gnu"
# https://github.com/conda/conda/issues/7031
# Conflicts with ZSH prompt, so reset with
# HOST=$(hostname)

alias R='R --no-save'
alias r='conda activate rstudio; HOST=$(hostname); clear; R --no-save'
alias renv='conda activate rstudio; HOST=$(hostname); clear;'
alias rstudio='conda activate rstudio; HOST=$(hostname); rstudio'
alias base='conda activate; HOST=$(hostname); clear'

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

# Fix home key error

typeset -A key
key=(
  BackSpace  "${terminfo[kbs]}"
  Home       "${terminfo[khome]}"
  End        "${terminfo[kend]}"
  Insert     "${terminfo[kich1]}"
  Delete     "${terminfo[kdch1]}"
  Up         "${terminfo[kcuu1]}"
  Down       "${terminfo[kcud1]}"
  Left       "${terminfo[kcub1]}"
  Right      "${terminfo[kcuf1]}"
  PageUp     "${terminfo[kpp]}"
  PageDown   "${terminfo[knp]}"
)

# Setup key accordingly
[[ -n "${key[BackSpace]}" ]] && bindkey "${key[BackSpace]}" backward-delete-char
[[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey "${key[End]}" end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}" delete-char
[[ -n "${key[Up]}"        ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Home]}"      ]] && bindkey -M vicmd "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -M vicmd "${key[End]}" end-of-line

# Launch TMUX
export TMUXRC="$HOME/.config/tmux/tmuxrc"
alias tmux="tmux -2 -f $TMUXRC"
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t anaconda 2>/dev/null || tmux new -s anaconda
fi

# Run neofetch to flex on the normies

neofetch

# $player
