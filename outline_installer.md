bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"



sudo dnf install:
musescore gvim



sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf check-update
sudo dnf install code


bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"



sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install gog-galaxy-wine



echo "x230" > /etc/hostname


xfce4-clipman???
xmodmap ~/.Xmodmap
