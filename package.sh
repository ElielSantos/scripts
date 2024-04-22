#!/bin/bash
############################################################# 
# Copyright (c) 2024, Eliel Santos <santoscyberx@gmail.com> #
#                                                           #
# Este script é de código aberto e seu uso é liberado       #
# All rights reserved.                                      #
#############################################################

# pode ser rodado direto no terminal
# -y Aceita Sim para todos os comandos $sudo

# Instalar Google Chrome
wget -q -O google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome.deb
sudo apt-get install -f -y
rm google-chrome.deb

# Instalar Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install code -y
rm packages.microsoft.gpg

# Instalar Terminator
sudo apt-get install terminator -y

# Instalar o visualizador htop
sudo apt install htop -y

# Instalar VLC
sudo apt install vlc -y

# Instalar Photoscape via Wine
sudo apt-get install wine -y
wget https://s3.amazonaws.com/cdn.photoscape.org/psa-full.exe
wine psa-full.exe
rm psa-full.exe

# Instalar CPU-X
sudo apt-get install cpu-x -y

# Instalar Oracle VM VirtualBox
sudo apt-get install virtualbox -y
