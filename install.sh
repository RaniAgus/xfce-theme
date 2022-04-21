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
  git-all \
  sassc \
  fonts-roboto \
  dconf-cli

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

git clone https://github.com/vinceliuice/Qogir-theme
cd Qogir-theme
./install.sh
cd ..
rm -rf Qogir-theme

git clone https://github.com/vinceliuice/Qogir-icon-theme
cd Qogir-icon-theme
./install.sh
cd ..
rm -rf Qogir-icon-theme
