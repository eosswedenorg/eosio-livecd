#!/bin/bash

PKG=(
    # Window manager
    xubuntu-core
    firefox=74.0+build3-0ubuntu0.18.04.1
)

apt-get install -y ${PKG[@]}
