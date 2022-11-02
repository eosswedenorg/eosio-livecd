#!/bin/bash

PKG=(
	htop=2.2.0-2build1
	fish=3.1.0-1.2
	mousepad=0.4.2-1
	keepassxc=2.4.3+dfsg.1-1build1
    /scripts/deb/linux-anchor-wallet-1.3.8-amd64.deb
)

pkg-install ${PKG[@]}
