#!/bin/bash

# Sync files in overlay to rootfs.
sudo -S rsync -v -l -p -cr overlay/ rootfs
