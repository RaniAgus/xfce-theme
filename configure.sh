#!/bin/bash -x

set -e

# Tema
xfconf-query -c xsettings -p /Net/ThemeName -s "Arc-Darker"
xfconf-query -c xfwm4 -p /general/theme -s "Arc-Darker"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-dark"

# Fuentes
xfconf-query -c xsettings -p /Gtk/FontName -s "Ubuntu 10"
xfconf-query -c xfwm4 -p /general/title_font -s "Ubuntu Bold 10"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "JetBrains Mono 10"

download() {
  file=${1:?}
  wget -O ~/$file "https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/$file"
}

# GNOME Terminal config
# https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
# https://www.linuxshelltips.com/export-import-gnome-terminal-profile/
download "terminal.dconf"
dconf load /org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')/ < ~/terminal.dconf
rm ~/terminal.dconf

# GTK config
mkdir -pv ~/.config/gtk-3.0
download ".config/gtk-3.0/bookmarks"
download ".config/gtk-3.0/gtk.css"

# Whisker Menu config
mkdir -pv ~/.config/xfce4 ~/.config/xfce4/panel
download ".config/xfce4/panel/whiskermenu-6.rc"

# Panel profile
download "panel.tar.bz2"
xfce4-panel-profiles load ~/panel.tar.bz2
rm -v ~/panel.tar.bz2
