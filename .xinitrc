#!/bin/sh
while true; do
    # Clean up apps gracefully then harshly
    killall -TERM chromium-browser 2>/dev/null;
    killall -TERM matchbox-window-manager 2>/dev/null;
    sleep 2;
    killall -9 chromium-browser 2>/dev/null;
    killall -9 matchbox-window-manager 2>/dev/null;

    # Clean up profile information
    rm -rf /home/pi/.cache;
    rm -rf /home/pi/.config;
    rm -rf /home/pi/.pki;

    # Generate bare minimum Chromium config
    mkdir -p /home/pi/.config/chromium/Default
    sqlite3 /home/pi/.config/chromium/Default/Web\ Data "CREATE TABLE meta(key LONGVARCHAR NOT NULL UNIQUE PRIMARY KEY, value LONGVARCHAR); INSERT INTO meta VALUES('version','46'); CREATE TABLE keywords (foo INTEGER);";

    # Disable DPMS / Screen blanking
    xset -dpms
    xset s off

    # Reset framebuffer's colour-depth
    fbset -depth $( cat /sys/module/*fb*/parameters/fbdepth );

    # Move cursor to bottom-right # comment out for mouse interaction
    xwit -root -warp $( cat /sys/module/*fb*/parameters/fbwidth ) $( cat /sys/module/*fb*/parameters/fbheight )

    # Start window manager, remove "-use_cursor no" for mouse interaction
    matchbox-window-manager -use_titlebar no -use_cursor no &

    # Start browser (See http://peter.sh/experiments/chromium-command-line-switches/)
    chromium-browser --no-first-run --noerrdialogs --kiosk http://start.duckduckgo.com

done;
