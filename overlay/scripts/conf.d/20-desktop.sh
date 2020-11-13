#!/bin/bash

PKG=(
    # Window manager
    xubuntu-core
    firefox=82.0.3+build1-0ubuntu0.18.04.1
)

pkg-install ${PKG[@]}
