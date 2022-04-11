.PHONY: all ds dm de theme icons fonts plugins gtk panel

all: ds dm de theme icons fonts plugins gtk panel
	xfce4-session-logout --logout

# Display server
ds:
	sudo apt-get install -y xorg openbox

# Display manager
dm:
	sudo apt-get install -y lightdm lightdm-gtk-greeter

# Desktop environment
de:
	sudo apt-get install -y xfce4

# Tema
theme:
	sudo apt-get install -y git sassc
	git clone https://github.com/vinceliuice/Qogir-theme
	cd Qogir-theme
	./install.sh
	./install.sh --tweaks round
	cd ..
	rm -rf Qogir-theme
	xfconf-query -c xsettings -p /Net/ThemeName -s "Qogir-dark"

# Icon theme
icons:
	git clone https://github.com/vinceliuice/Qogir-icon-theme
	cd Qogir-icon-theme
	./install.sh
	cd ..
	rm -rf Qogir-icon-theme
	xfconf-query -c xsettings -p /Net/IconThemeName -s "Qogir-dark"

# Fuentes
fonts:
	sudo apt-get install -y fonts-roboto
	xfconf-query -c xsettings -p /Gtk/FontName -s "Roboto 10"
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
	xfconf-query -c xsettings -p /Gtk/MonospaceFontName -s "JetBrains Mono 10"

# Plugins
plugins:
	sudo add-apt-repository ppa:gottcode/gcppa
	sudo apt-get update && sudo apt-get install -y \
		xfce4-whiskermenu-plugin

# GTK config
gtk:
	mkdir -pv ~/.config/gtk-3.0
	wget -O ~/.config/gtk-3.0/bookmarks "https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/gtk-3.0/bookmarks"
	wget -O ~/.config/gtk-3.0/gtk.css "https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/gtk-3.0/gtk.css"

# Panel profile
panel:
	sudo apt-get install -y xfce4-panel-profiles
	wget https://github.com/RaniAgus/xfce-theme/raw/main/xfce4-panel-profile.tar.bz2
	xfce4-panel-profiles load ./xfce4-panel-profile.tar.bz2
	rm -v ./xfce4-panel-profile.tar.bz2
	sed -i -e '/^button-icon=/ s/=.*/=distributor-logo-xubuntu/' ~/.config/xfce4/panel/whiskermenu-6.rc
