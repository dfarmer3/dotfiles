#!/usr/bin/env bash

# Work in progress ofc






dnf install 
# programs
firefox konsole kate gimp
# terminal programs
vim tmux zsh neofetch
# Miscellaneous
autokey-gtk postgresql

#xfce specific:
xfce4-panel-profiles
jq cmake hplip-gui 



finger

mkdir github
cd github



chsh -s $(which zsh)

conda install -c conda-forge pygobject #for chicago95 autoinstall
sudo echo "localhost.localdomain" > /etc/hostname

xmodmap ~/.config/.Xmodmap
autokey-gtk


/home/dennisfarmer/.local/share/kite/kited --system-boot
redshift-gtk




# Make neofetch faster
#/usr/bin/neofetch
#comment out:
#has "rpm" && tot rpm -qa

# R Stuff
install.packages("remotes")
remotes::install_github("tallguyjenks/gruvboxr")
