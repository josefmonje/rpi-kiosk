# FROM jessie lite
sudo apt-get install --no-install-recommends xinit matchbox xwit xserver-xorg xserver-xorg-video-fbdev x11-xserver-utils ttf-mscorefonts-installer sqlite3 libnss3 unclutter chromium-browser -y
sudo apt-get update -y
sudo apt-get dist-upgrade -y

sudo mv -f rc.local /etc/rc.local
sudo mv -f xinitrc ~/.xinitrc

echo '\nstartx\n' >> ~/.bashrc

sudo reboot
