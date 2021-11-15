#!/bin/bash

PKG=(
    linux-generic=4.15.0.162.151
    ubuntu-minimal=1.417
    locales=2.27-3ubuntu1.2

    # Livesystem stuffs.
    casper=1.394
    lupin-casper=0.57build1
    discover=2.1.2-8
    laptop-detect=0.16
    os-prober=1.74ubuntu1

    # Network
    network-manager=1.10.6-2ubuntu1.1
    resolvconf=1.79ubuntu10
    net-tools=1.60+git20161116.90da8a0-1ubuntu1
    wireless-tools=30~pre9-12ubuntu1

    # Base programs
    software-properties-common=0.96.24.32.14
    nano=2.9.3-2
    vim=2:8.0.1453-1ubuntu1.7
    curl=7.58.0-2ubuntu3.16
    less=487-0.1
)

pkg-install ${PKG[@]}
