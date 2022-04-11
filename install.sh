#!/bin/bash -x

set -e

sudo add-apt-repository -y ppa:gottcode/gcppa
sudo apt-get update && sudo apt-get install -y \
  xorg \
  openbox \
  lightdm \
  lightdm-gtk-greeter \
  xfce4 \
  git \
  sassc \
  fonts-roboto \
  xfce4-whiskermenu-plugin \
  xfce4-panel-profiles

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

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
