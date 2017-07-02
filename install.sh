#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y

sudo apt-get install --no-install-recommends -y \
    matchbox \
    xinit \
    xwit \
    xserver-xorg \
    xserver-xorg-legacy \
    xserver-xorg-video-fbdev \
    x11-xserver-utils \
    ttf-mscorefonts-installer \
    sqlite3 \
    libnss3 \
    unclutter \
    chromium-browser \
    rpi-chromium-mods \
    -y

sudo cp kiosk.sh /opt
sudo cp .xinitrc /opt

sudo cat >> /boot/config.txt <<- EOM
gpu_mem=256
EOM

sudo cat >> /etc/kbd/config <<- EOM
BLANK_TIME=0
POWERDOWN_TIME=0
EOM

echo "/opt/kiosk.sh" >> ~/.bashrc
