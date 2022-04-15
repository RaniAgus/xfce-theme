#!/bin/bash -x

set -e

sudo apt install --reinstall ca-certificates

sudo add-apt-repository -y ppa:git-core/ppa
sudo add-apt-repository -y ppa:gottcode/gcppa
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-get update && sudo apt-get install -y \
  xorg \
  lightdm \
  lightdm-gtk-greeter \
  xfce4 \
  git-all \
  sassc \
  numix-blue-gtk-theme \
  fonts-roboto \
  xfce4-whiskermenu-plugin \
  xfce4-panel-profiles

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

git clone https://github.com/vinceliuice/Qogir-icon-theme
cd Qogir-icon-theme
./install.sh
cd ..
rm -rf Qogir-icon-theme

# https://askubuntu.com/a/500813
sudo mkdir /usr/share/xsessions/hidden
sudo dpkg-divert --rename \
      --divert /usr/share/xsessions/hidden/ubuntu.desktop \
      --add /usr/share/xsessions/ubuntu.desktop
