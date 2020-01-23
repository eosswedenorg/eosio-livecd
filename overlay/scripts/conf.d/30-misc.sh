#!/bin/bash

PKG=(
    htop
    fish
    mousepad
    keepassxc
)

apt-get install -y ${PKG[@]}
