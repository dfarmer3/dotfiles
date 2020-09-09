#!/usr/bin/env bash

### Install Programs

sudo dnf install \
firefox cheese konsole kate gimp \ # programs
vim tmux brasero zsh neofetch onedrive youtube-dl \ # terminal programs
nodejs latexmk texlive texlive-isodate texlive-textpos jq cmake g++ hplip-gui flatpak autokey-gtk postgresql \ # miscellaneous
xfce4-panel-profiles \ #xfce specific
#xarchiver 
chsh -s $(which zsh)
###
#youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=uWusmdmc0to

mkdir ~/.vim/backup
mkdir ~/.vim/swap

# https://rpmfusion.org/Configuration/
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# rpmfusion free
sudo dnf install -y ffmpeg exfat-utils fuse-exfat 
# rpmfusion nonfree
sudo dnf install -y unrar


### Import Github scripts
mkdir ~/github
cd ~/github

git clone https://github.com/dennisfarmer/dotfiles.git 
git clone https://github.com/dennisfarmer/dennisfarmer.github.io.git 
git clone https://github.com/dennisfarmer/cengage-webscraper.git
git clone https://github.com/dennisfarmer/scripts.git
git clone https://github.com/dennisfarmer/Factors-of-Academic-Success.git 

# Script installation:
cp ./scripts/copyconfig.sh $HOME/bin/copyconfig
chmod u+x $HOME/bin/copyconfig

cp ./scripts/sort_course_files/sort_course_files.sh $HOME/bin/sort_course_files && chmod u+x $HOME/bin/sort_course_files

# $SCRIPTS = home/user/github/scripts (vimrc line)
chmod u+x ./scripts/latex_autocompile_vim/latex_script.sh


### Import Dotfiles (after all programs are installed)
cd ~/github/dotfiles
copyconfig -i




### Jekyll
sudo dnf install ruby ruby-devel @development-tools
#echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
#echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
#echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
#source ~/.bashrc
gem install jekyll bundler



# Postgres
conda install -c conda-forge postgresql


conda install -c conda-forge pygobject #for chicago95 autoinstall
sudo echo "localhost.localdomain" > /etc/hostname



### todo: autostart the following lines on startup:
#xmodmap ~/.config/.Xmodmap
#autokey-gtk
#/home/dennisfarmer/.local/share/kite/kited --system-boot
#redshift-gtk <-- ???

### Handbrake
#https://www.maketecheasier.com/install-handbrake-linux-rip-dvd/
#sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#sudo dnf install rpmfusion-free-release-tainted
#sudo dnf install libdvdcss handbrake-gui

# Make neofetch faster
#/usr/bin/neofetch
#comment out:
#has "rpm" && tot rpm -qa
#finger

# R Stuff
#install.packages("remotes")
#remotes::install_github("tallguyjenks/gruvboxr")

# Before running copyconfig, source env



