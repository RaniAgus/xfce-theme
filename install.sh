#!/bin/bash -x

set -e

sudo add-apt-repository -y ppa:gottcode/gcppa
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update && sudo apt-get install -y \
  xorg \
  openbox \
  lightdm \
  lightdm-gtk-greeter \
  xfce4 \
  papirus-icon-theme \
  fonts-roboto \
  xfce4-whiskermenu-plugin \
  xfce4-panel-profiles

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
