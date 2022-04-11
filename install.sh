#!/bin/bash -x

sudo add-apt-repository ppa:gottcode/gcppa
sudo apt-get update && apt-get install -y \
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

sudo reboot
