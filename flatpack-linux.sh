#!/bin/bash

set -e
sudo su
sudo apt update
sudo apt install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
 sudo apt install gnome-software-plugin-flatpak

mkdir -p ~/.themes
cp -a /usr/share/themes/* ~/.themes/
sudo flatpak override --filesystem=~/.themes/

exit 