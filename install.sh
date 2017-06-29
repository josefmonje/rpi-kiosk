#!/bin/bash

mv kiosk.sh ~
mv .xinitrc ~/.xinitrc

sudo apt-get update -y && sudo apt-get upgrade -y

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
