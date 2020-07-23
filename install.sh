#!/usr/bin/env bash

# Work in progress ofc

dnf install 
cmake hplip-gui finger



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
