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
