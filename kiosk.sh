#!/bin/bash
# Wait for screen...
while ! $( tvservice --dumpedid /tmp/edid | fgrep -qv 'Nothing written!' ); do
	bHadToWaitForScreen=true;
	printf "===> Waiting for screen...\n"
	sleep ;
done;

printf “===> Screen is on, extracting preferred mode…\n”
_DEPTH=32;
eval $( edidparser /tmp/edid | fgrep 'preferred mode' | tail -1 | sed -Ene 's/^.+(DMT|CEA) \(([0-9]+)\) ([0-9]+)x([0-9]+)[pi]? @.+/_GROUP=\1;_MODE=\2;_XRES=\3;_YRES=\4;/p' );

printf "===> Resetting screen to preferred mode: %s-%d (%dx%dx%d)...\n" $_GROUP $_MODE $_XRES $_YRES $_DEPTH
tvservice --explicit="$_GROUP $_MODE"
sleep 1;

printf "===> Resetting frame-buffer to %dx%dx%d...\n" $_XRES $_YRES $_DEPTH
fbset --all --geometry $_XRES $_YRES $_XRES $_YRES $_DEPTH -left 0 -right 0 -upper 0 -lower 0;
sleep 1;

# Startup
if [ -f /home/pi/.xinitrc ]; then
	ln -fs /opt/.xinitrc /home/pi/.xinitrc;
	su - pi -c 'startx' &
fi
