#!/bin/bash

PKG=(
	htop=3.0.5-7build2
	fish=3.3.1+ds-3
	mousepad=0.5.8-1
	keepassxc=2.6.6+dfsg.1-1
    /scripts/deb/linux-anchor-wallet-1.3.1-amd64.deb
)

pkg-install ${PKG[@]}
