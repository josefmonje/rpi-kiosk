#!/bin/bash

sudo mv kiosk.sh /opt
sudo mv .xinitrc /opt

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
