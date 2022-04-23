#!/bin/bash -x

set -e

sudo apt install --reinstall ca-certificates

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
  | sudo tee /etc/apt/sources.list.d/vscode.list
rm -rf packages.microsoft.gpg

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
  openjdk-11-jdk \
  git-all \
  terminator \
  mousepad \
  xarchiver \
  firefox \
  dconf-cli \
  arc-theme \
  code

sudo snap install clion --classic

wget https://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2022-03/R/eclipse-cpp-2022-03-R-linux-gtk-x86_64.tar.gz
sudo tar xzf eclipse-cpp-*.tar.gz -C /opt
rm eclipse-cpp-*.tar.gz

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

git clone https://github.com/vinceliuice/Tela-icon-theme
cd Tela-icon-theme
./install.sh
cd ..
rm -rf Tela-icon-theme
