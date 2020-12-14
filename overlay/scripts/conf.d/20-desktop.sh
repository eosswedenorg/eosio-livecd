#!/bin/bash

PKG=(
    # Window manager
    xubuntu-core
    firefox=83.0+build2-0ubuntu0.18.04.2
)

pkg-install ${PKG[@]}
