#!/bin/bash -x

set -e

# Tema
xfconf-query -c xsettings -p /Net/ThemeName -s "Qogir-dark"
xfconf-query -c xfwm4 -p /general/theme -s "Qogir-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Qogir-dark"

# Fuentes
xfconf-query -c xsettings -p /Gtk/FontName -s "Roboto 10"
xfconf-query -c xfwm4 -p /general/title_font -s "Roboto Bold 10"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "JetBrains Mono 10"

download() {
  file=${1:?}
  wget -O ~/.config/$file "https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/$file"
}

# GTK config
mkdir -pv ~/.config/gtk-3.0
download "gtk-3.0/bookmarks"
download "gtk-3.0/gtk.css"

# Whisker Menu config
mkdir -pv ~/.config/xfce4 ~/.config/xfce4/panel
download "xfce4/panel/whiskermenu-6.rc"

# Panel profile
wget https://github.com/RaniAgus/xfce-theme/raw/main/xfce4-panel-profile.tar.bz2
xfce4-panel-profiles load ./xfce4-panel-profile.tar.bz2
rm -v ./xfce4-panel-profile.tar.bz2
