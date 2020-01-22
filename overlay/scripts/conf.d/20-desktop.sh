#!/bin/bash

PKG=(
    # Window manager
    xubuntu-core^
    firefox
)

apt-get install -y ${PKG[@]}
