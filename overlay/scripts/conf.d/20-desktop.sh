#!/bin/bash

PKG=(
    # Window manager
    xubuntu-core=2.225
    firefox=94.0+build3-0ubuntu0.18.04.1
)

pkg-install ${PKG[@]}
