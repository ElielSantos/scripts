#!/bin/bash

# Instalar Google Chrome
wget -q -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome.deb
sudo apt-get install -f
rm google-chrome.deb

# Instalar Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code
rm packages.microsoft.gpg

# Instalar Terminator
sudo apt-get install terminator

# Instalar o visualizador htop
sudo apt install htop

# Instalar GIMP
sudo apt-get install gimp

# Instalar VLC
sudo apt install vlc

# Instalar Photoscape via Wine
sudo apt-get install wine
wget https://s3.amazonaws.com/cdn.photoscape.org/psa-full.exe
wine psa-full.exe
rm psa-full.exe

# Instalar o qbtorrent
sudo apt install qbittorrent

# Instalar CPU-X
sudo apt-get install cpu-x

# Instalar Oracle VM VirtualBox
sudo apt-get install virtualbox
