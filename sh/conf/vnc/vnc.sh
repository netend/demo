#!/bin/bash
apt-get install -y xfce4 xfce4-goodies gnome-icon-theme tightvncserver  iceweasel   websockify novnc  ttf-wqy-zenhei  #ttf-arphic-uming
apt install expect -y
wget http://download.daili.cf/52/zip/noVNC.zip
unzip noVNC.zip
mv noVNC /var/
sudo chmod -R 755 /var/noVNC
ln -s /var/noVNC/utils/launch.sh  /usr/local/bin/novnc

cat <<EOFF >> /usr/local/bin/vncpass
$
EOFF
sudo bash /usr/local/bin/vncpass
vncserver
sudo nohup novnc --vnc localhost:5901 >/dev/null&
