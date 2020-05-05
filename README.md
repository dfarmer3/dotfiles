# My Dotfiles (System Configuration)
<hr>
These are configuration files for my different linux enviroments. Old-Arch-Setup contains a KDE+i3wm setup that I used to use before switching to my current XFCE with Chicago95 setup.

# Setup Summary
I'll write this later, no one's going to read this anyways, its just for my organization



<br>
<hr>
# Install Guides
### Install ohmyzsh
`sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"`
### Install zsh-syntax-highlighting
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

# Error Troubleshooting
### DNF Error: DB\_VERSION\_MISMATCH
If the above error occurs while installing a package, run the following:

`rm -f /var/lib/rpm/__db*`
`dnf update`

### Ruby Jekyll Installation Error
Error:

`gcc: error: /usr/lib/rpm/redhat/redhat-hardened-cc1: No such file or directory`

Solution:

`sudo dnf install redhat-rpm-config`

### Github Pages 404

Recommit the repo:

`git commit --allow-empty -m "Trigger rebuild"`
