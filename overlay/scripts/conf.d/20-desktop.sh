#!/bin/bash

# Window manager
pkg-install --no-install-recommends \
    xubuntu-core=2.241 \
    network-manager-gnome=1.24.0-1ubuntu3 \
    xfce4-statusnotifier-plugin=0.2.3-1 \
    xfce4-whiskermenu-plugin=2.7.1-1 \
    xfce4-power-manager-plugins=4.16.0-1 \
    xfce4-terminal=0.8.10-1

pkg-install firefox=1:1snap1-0ubuntu2

# Bit of a hack, could not get xfce to change background.
# So instead, lets just move the default and symlink to it.
ORIG_BG_FILE=/usr/share/backgrounds/xfce/xfce-stripes.png
if [ ! -L "${ORIG_BG_FILE}" ]; then
    mv "${ORIG_BG_FILE}" "${ORIG_BG_FILE}.orig"
    ln -s /usr/share/backgrounds/south-west-eden.jpg "${ORIG_BG_FILE}"
fi
