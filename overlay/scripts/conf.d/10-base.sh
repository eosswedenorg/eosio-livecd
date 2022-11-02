#!/bin/bash

PKG=(
    linux-generic=5.15.0.52.52
    memtest86+=5.31b+dfsg-4
    ubuntu-minimal=1.481
    locales=2.35-0ubuntu3

    # Livesystem stuffs.
    casper=1.470
    #lupin-casper=0.57build1
    discover=2.1.2-10
    laptop-detect=0.16
    os-prober=1.79ubuntu2

    # Network
    network-manager=1.36.6-0ubuntu2
    resolvconf=1.84ubuntu1
    net-tools=1.60+git20181103.0eebece-1ubuntu5
    wireless-tools=30~pre9-13.1ubuntu4

    # Base programs
    software-properties-common=0.99.22.3
    nano=6.2-1
    vim=2:8.2.3995-1ubuntu2.1
    curl=7.81.0-1ubuntu1.6
    less=590-1build1
)

pkg-install ${PKG[@]}

config-install /etc/casper.conf
