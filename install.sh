#!/bin/bash -x

set -e

sudo apt install --reinstall ca-certificates

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:gottcode/gcppa
sudo apt-get update && sudo apt-get install -y \
  xorg \
  lightdm \
  lightdm-gtk-greeter \
  xfce4 \
  xfce4-whiskermenu-plugin \
  xfce4-panel-profiles \
  gnome-keyring \
  git-all \
  sassc \
  libglib2.0-dev libgdk-pixbuf2.0-dev libxml2-utils \
  fonts-roboto \
  dconf-cli

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

git clone https://github.com/numixproject/numix-gtk-theme
cd numix-gtk-theme
sudo make install
cd ..
sudo rm -rf numix-gtk-theme

git clone https://github.com/vinceliuice/Qogir-icon-theme
cd Qogir-icon-theme
./install.sh
cd ..
rm -rf Qogir-icon-theme
