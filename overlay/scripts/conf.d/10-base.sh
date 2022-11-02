#!/bin/bash

PKG=(
    linux-generic=5.4.0.131.131
    memtest86+=5.01-3.1ubuntu2.1
    ubuntu-minimal=1.450.2
    locales=2.31-0ubuntu9.9

    # Livesystem stuffs.
    casper=1.445.3
    lupin-casper=0.57build1
    discover=2.1.2-8
    laptop-detect=0.16
    os-prober=1.74ubuntu2

    # Network
    network-manager=1.22.10-1ubuntu2.3
    resolvconf=1.82
    net-tools=1.60+git20180626.aebd88e-1ubuntu1
    wireless-tools=30~pre9-13ubuntu1

    # Base programs
    software-properties-common=0.99.9.8
    nano=4.8-1ubuntu1
    vim=2:8.1.2269-1ubuntu5.9
    curl=7.68.0-1ubuntu2.14
    less=551-1ubuntu0.1
)

pkg-install ${PKG[@]}

config-install /etc/casper.conf
