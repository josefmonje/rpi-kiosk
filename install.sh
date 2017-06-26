#!/bin/bash

chmod +x kiosk.sh
mv -f kiosk.sh /boot/kiosk.sh
echo "\n/boot/kiosk.sh &\n\nexit 0\n" >> /etc/rc.local

mv -f xinitrc /boot/xinitrc
ln -sf /boot/initrx /home/pi/.xinitrc

apt-get install --no-install-recommends -y \
    matchbox \
    xinit \
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
