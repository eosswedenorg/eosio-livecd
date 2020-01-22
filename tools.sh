#!/bin/bash

# Install all tools we need.
sudo apt-get install -y \
    binutils \
    debootstrap \
    squashfs-tools \
    xorriso \
    grub-pc-bin \
    grub-efi-amd64-bin \
    mtools \
    unzip
