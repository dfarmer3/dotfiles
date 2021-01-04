#!/usr/bin/env bash

### Install Programs

sudo dnf install -y firefox okular cheese konsole kate gimp vim gvim tmux brasero zsh cups neofetch onedrive youtube-dl nodejs jq latexmk texlive texlive-isodate texlive-textpos xclip hplip-gui flatpak autokey-gtk xpad krita gwenview


# Programming Packages
sudo dnf install -y cmake g++ R rstudio python-devel git postgresql libpq-devel
pip install numpy pandas scikit-learn seaborn matplotlib scipy psycopg2


# pip install or conda install

# dbus-python PyGObject





# https://fedoramagazine.org/jupyter-and-data-science-in-fedora/
# sudo dnf install -y xfce4-panel-profiles

# Install Vim Package Manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install OhMyZsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#xarchiver 
chsh -s $(which zsh)
###
#youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=uWusmdmc0to

mkdir ~/.vim/backup
mkdir ~/.vim/swap

# https://rpmfusion.org/Configuration/
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# rpmfusion free
sudo dnf install -y ffmpeg exfat-utils fuse-exfat 
# rpmfusion nonfree
sudo dnf install -y unrar


### Import Github scripts
mkdir ~/github
cd ~/github

# git clone https://github.com/dennisfarmer/dotfiles.git 
git clone https://github.com/dennisfarmer/dennisfarmer.github.io.git 
git clone https://github.com/dennisfarmer/cengage-webscraper.git
# git clone https://github.com/dennisfarmer/scripts.git
git clone https://github.com/dennisfarmer/Factors-of-Academic-Success.git 

# Script installation:
cp ./scripts/copyconfig.sh $HOME/bin/copyconfig
chmod u+x $HOME/bin/copyconfig

cp ./scripts/sort_course_files/sort_course_files.sh $HOME/bin/sort_course_files && chmod u+x $HOME/bin/sort_course_files

### Import Dotfiles (after all programs are installed)
source ~/github/dotfiles/zshenv
cd ~/github/dotfiles

# TODO: make option to skip confirmation prompt
copyconfig --script
vim +PluginInstall +qall




### Jekyll
sudo dnf install -y ruby ruby-devel @development-tools
#echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
#echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
#echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
#source ~/.bashrc
# gem install jekyll bundler



# Postgres
# conda install -c conda-forge postgresql


# conda install -c conda-forge pygobject #for chicago95 autoinstall
# sudo echo "localhost.localdomain" > /etc/hostname

#sudo dnf install -y conda
# conda create -n rstats R rstudio
sudo dnf install -y flatpak
sudo flatpak remote-add flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub ch.openboard.OpenBoard
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



