#!/bin/bash -x

# Display server
sudo apt-get install -y xorg openbox

# Display manager
sudo apt-get install -y lightdm lightdm-gtk-greeter

# Desktop environment
sudo apt-get install -y xfce4

# Tema
sudo apt-get install -y git sassc
git clone https://github.com/vinceliuice/Qogir-theme
cd Qogir-theme
./install.sh
./install.sh --tweaks round
cd ..
rm -rf Qogir-theme
xfconf-query -c xsettings -p /Net/ThemeName -s "Qogir-dark"

# Icon pack
git clone https://github.com/vinceliuice/Qogir-icon-theme
cd Qogir-icon-theme
./install.sh
cd ..
rm -rf Qogir-icon-theme
xfconf-query -c xsettings -p /Net/IconThemeName -s "Qogir-dark"

# Fuentes
sudo apt-get install -y fonts-roboto
xfconf-query -c xsettings -p /Gtk/FontName -s "Roboto 10"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "JetBrains Mono 10"

# Plugins
sudo add-apt-repository ppa:gottcode/gcppa
sudo apt-get update && sudo apt-get install -y \
  xfce4-whiskermenu-plugin

# GTK config
mkdir -pv ~/.config/gtk-3.0
download() {
  file=${1:?}
  wget -O ~/.config/$file "https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/$file"
}
download "gtk-3.0/bookmarks"
download "gtk-3.0/gtk.css"

# Panel profile
sudo apt-get install -y xfce4-panel-profiles
wget https://github.com/RaniAgus/xfce-theme/raw/main/xfce4-panel-profile.tar.bz2
xfce4-panel-profiles load ./xfce4-panel-profile.tar.bz2
rm -v ./xfce4-panel-profile.tar.bz2

# Whiskermenu config
whiskermenu_set() {
  key=${1:?}
  value=${2:?}
  sed -i -e '/^'$key'=/ s/=.*/='$value'/' ~/.config/xfce4/panel/whiskermenu-6.rc
}
whiskermenu_set "button-icon" "distributor-logo-xubuntu"

# Logout
xfce4-session-logout --logout
