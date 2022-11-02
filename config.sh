#!/bin/bash

# The ubuntu version to use
UBUNTU_VERSION=22.04
UBUNTU_CODENAME=jammy

# Ubuntu Archive mirror
# Checkout https://launchpad.net/ubuntu/+archivemirrors if you want a faster one.
UBUNTU_MIRROR=http://se.archive.ubuntu.com

# Name used for iso volume id, hostname in the live environment.
TARGET_NAME=eosio-live

# LiveCD version
TARGET_VERSION=01

# Fullname used for output files.
TARGET_FULLNAME="${TARGET_NAME}-${UBUNTU_VERSION}-${TARGET_VERSION}"

# Text label to show in GRUB
GRUB_BOOT_LABEL="Eosio Live"
