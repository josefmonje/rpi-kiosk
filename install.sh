# FROM jessie lite
sudo cat rc.local >> /etc/rc.local
sudo mv -f xinitrc /boot/xinitrc
sudo ln -sf /boot/initrx /home/pi/.xinitrc

sudo apt-get install --no-install-recommends \
    xinit \
    matchbox \
    xwit \
    xserver-xorg \
    xserver-xorg-video-fbdev \
    x11-xserver-utils \
    ttf-mscorefonts-installer \
    sqlite3 \
    libnss3 \
    unclutter \
    chromium-browser \
    rpi-chromium-mods \
    -y
