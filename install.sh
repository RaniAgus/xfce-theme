#!/bin/bash

# Display server
sudo apt-get install -y xorg openbox

# Display manager
sudo apt-get install -y lightdm lightdm-gtk-greeter

# Desktop environment
sudo apt-get install -y xfce4 xfce4-panel-profiles

# Temas
sudo apt-get install -y git sassc
git clone https://github.com/vinceliuice/Qogir-theme
cd Qogir-theme
./install.sh
./install.sh --tweaks round
cd ..
rm -rf Qogir-theme

git clone https://github.com/vinceliuice/Qogir-icon-theme
cd Qogir-icon-theme
./install.sh
cd ..
rm -rf Qogir-icon-theme

# Fuentes
sudo apt-get install fonts-roboto
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# Plugins
sudo add-apt-repository ppa:gottcode/gcppa
sudo apt-get update && sudo apt-get install -y \
  xfce4-whiskermenu-plugin

# Panel
cp -uva ./gtk-3.0/. ~/.config/gtk-3.0
xfce4-panel-profiles load ./xfce4-panel-profile.tar.bz2
