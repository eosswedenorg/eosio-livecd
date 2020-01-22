#!/bin/bash

PKG=(
    ubuntu-minimal
    locales
    linux-generic

    # Livesystem stuffs.
    casper
    lupin-casper
    discover
    laptop-detect
    os-prober

    # Network
    network-manager
    resolvconf
    net-tools
    wireless-tools

    # Base programs
    software-properties-common
    nano
    vim
    curl
    less
)

apt-get -y install ${PKG[@]}
