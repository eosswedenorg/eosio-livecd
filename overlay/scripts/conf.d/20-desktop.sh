#!/bin/bash

# Window manager
pkg-install --no-install-recommends \
    xubuntu-core=2.233 \
    network-manager-gnome=1.8.24-1ubuntu3 \
    xfce4-statusnotifier-plugin=0.2.2-1 \
    xfce4-whiskermenu-plugin=2.4.3-1 \
    xfce4-power-manager-plugins=1.6.6-1 \
    xfce4-terminal=0.8.9.1-1

pkg-install firefox=94.0+build3-0ubuntu0.20.04.1

# Bit of a hack, could not get xfce to change background.
# So instead, lets just move the default and symlink to it.
ORIG_BG_FILE=/usr/share/backgrounds/xfce/xfce-stripes.png
if [ ! -L "${ORIG_BG_FILE}" ]; then
    mv "${ORIG_BG_FILE}" "${ORIG_BG_FILE}.orig"
    ln -s /usr/share/backgrounds/south-west-eden.jpg "${ORIG_BG_FILE}"
fi
