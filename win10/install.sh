#!/usr/bin/env bash
# Run as sudo (i think)
sudo apt-get update
sudo apt-get install -y vim vim-gtk3 wget jq zsh tmux make cmake gcc
mkdir -p ~/.local/bin
mkdir -p github
git clone https://github.com/dennisfarmer/dotfiles.git ~/github/dotfiles >/dev/null 2>&1 || echo "dennisfarmer/dotfiles.git already downloaded from github..."
wget https://raw.githubusercontent.com/dennisfarmer/scripts/master/copyconfig/copyconfig.sh ~/.local/bin/copyconfig
chmod u+x ~/.local/bin/copyconfig
mkdir -p ~/.config
source ~/github/dotfiles/zshenv

bash ~/.local/bin/copyconfig --config ~/github/dotfiles/win10/copyconfig_win10.json --dotfiles ~/github/dotfiles --script 

mkdir ~/.vim/backup
mkdir ~/.vim/swap
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
