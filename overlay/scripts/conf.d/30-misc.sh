#!/bin/bash

PKG=(
	htop=2.1.0-3
	fish=2.7.1-3
	mousepad=0.4.0-4ubuntu1
	keepassxc=2.3.1+dfsg.1-1
)

pkg-install ${PKG[@]}
