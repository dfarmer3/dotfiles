# Windows 10 Dotfile Installation Walkthrough

### WSL Debian
```zsh
sudo apt update
sudo apt install exfat-fuse exfat-utils
```
https://medium.com/@alllexsm/how-to-install-z-shell-zsh-on-cygwin-dd9ee380d783


### Cygwin Setup:

```zsh
# Install Packages
/cygdrive/c/Users/dennis/Downloads/setup-x86_64.exe -q -P lynx,wget,tar,git,vim,gcc-g++,cmake,make

# Install Cygwin Package Manager
wget -P /bin/ rawgit.com/transcode-open/apt-cyg/master/apt-cyg
chmod +x /bin/apt-cyg
apt-cyg install zsh

```

### Create Cygwin zsh shortcut on desktop

```
> Create Shortcut:
C:\cygwin64\bin\mintty.exe -i /Cygwin-Terminal.ico /bin/zsh --login
```
