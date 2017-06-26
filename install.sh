# FROM jessie lite
sudo cat rc.local >> /etc/rc.local
sudo mv -f xinitrc /etc/xinitrc
sudo ln -sf /etcx/initrx ~/.xinitrc
echo '\nstartx\n' >> ~/.bashrc

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

    #mosh \
    #tmux \
    #w3m-img \
    #mc \
    #moc \
    -y
