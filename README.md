# xfce-theme

1. Instalar interfaz `xfce` y reiniciar:

```bash
wget -qO- https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/install.sh >> install.sh
bash -x ./install.sh
rm ./install.sh
sudo reboot
```

2. Loguearse usando "xfce session"

3. Configurar tema bonito:

```bash
wget -qO- https://raw.githubusercontent.com/RaniAgus/xfce-theme/main/configure.sh | bash -x
xfce4-session-logout --logout
```
